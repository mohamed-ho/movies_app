import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/network/api_manegar.dart';
import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/movie_feature/domain/entities/genres.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/presentation/bloc/bloc/season_and_episode_bloc.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_bloc.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_event.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_state.dart';
import 'package:movies_app/tv_feature/presentation/widgets/season_drop_down_widget.dart';
import 'package:shimmer/shimmer.dart';

class TvDetailsScreen extends StatelessWidget {
  final int id;

  const TvDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MovieDetailContent(
        id: id,
      ),
    );
  }
}

// ignore: must_be_immutable
class MovieDetailContent extends StatefulWidget {
  //final List<Recommendation> recommendations;
  final int id;

  MovieDetailContent({super.key, required this.id});

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

bool isActive = true;

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvBloc>(
      create: (context) => ls<TvBloc>(),
      child: BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) => previous != current,
        bloc: ls<TvBloc>()..add(DetailsTvEvent(id: widget.id)),
        builder: (context, state) {
          if (state is TvErrorState) {
            return const Center(
              child: Text('you have error'),
            );
          } else if (state is TvDetailsLoadedState) {
            final Tv movie = state.tv;
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl:
                              ApiManegar.imageUrl(movie.backdropPath ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.name!,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  movie.firstAirDate!.split('-')[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (movie.voteAverage / 2).toStringAsFixed(1),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${movie.voteAverage})',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                _showDuration(movie.voteCount),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            movie.overView!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(movie.genres!)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isActive = true;
                          setState(() {});
                        },
                        child: TabButton(title: 'EPISODES', isActive: isActive),
                      ),
                      InkWell(
                          onTap: () {
                            isActive = false;
                            setState(() {});
                          },
                          child: TabButton(
                              title: 'MORE LIKE THIS', isActive: !isActive))
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: isActive
                      ? TvEpisodeListView(movie, context)
                      : _showRecommendations(widget.id),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

Widget _showRecommendations(int id) {
  return BlocBuilder<TvBloc, TvState>(
    bloc: ls<TvBloc>()..add(RecommendationTvEvent(id: id)),
    builder: (context, state) {
      if (state is TvErrorState) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Text('you have Error'),
          ),
        );
      } else if (state is TvRemommendationLoadedState) {
        List<Tv> recommendation = state.tv;

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // final recommendation = state.recommendationMovies[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TvDetailsScreen(
                              id: recommendation[index].id,
                            ))),
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl: ApiManegar.imageUrl(
                          recommendation[index].backdropPath ?? ''),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: recommendation.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      } else {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    },
  );
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const TabButton({required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isActive)
          Container(
            height: 3.0,
            width: MediaQuery.of(context).size.width /
                2, // Adjust the width as needed
            color: Colors.red,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget TvEpisodeListView(Tv tv, BuildContext context) {
  return BlocProvider(
      create: (context) => ls<SeasonAndEpisodeBloc>(),
      child: SliverList.builder(
        itemBuilder: (context, i) {
          print(i);

          if (tv.numberOfSeason == null)
            return Text('no Season', style: TextStyle(color: Colors.white));
          else
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SeasonDropDownWidget(
                  index: i,
                  tv: tv,
                ));
        },
        itemCount: tv.numberOfSeason == null ? 1 : tv.numberOfSeason,
      ));
}
