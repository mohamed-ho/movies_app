import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_manegar.dart';
import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_bloc.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_event.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_state.dart';
import 'package:movies_app/tv_feature/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRateTv extends StatelessWidget {
  const TopRateTv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvBloc>(
      create: (context) => ls<TvBloc>()..add(TopRateTvEvent()),
      child: BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is TvErrorState) {
            return const Center(
              child: Text('you have Error'),
            );
          } else if (state is TvLoadedState) {
            List<Tv> moviesList = state.tv;
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    final movie = moviesList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TvDetailsScreen(
                                      id: moviesList[index].id)));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                                ApiManegar.imageUrl(movie.backdropPath ?? ''),
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
