import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_manegar.dart';
import 'package:movies_app/core/utils/app_strings.dart';

import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';
import 'package:movies_app/movie_feature/presentation/bloc/Movies_even.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_state.dart';
import 'package:movies_app/movie_feature/presentation/screens/movie_detail_screen.dart';

import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class MoreMovieScreen extends StatelessWidget {
  MoreMovieScreen({super.key, required this.type});
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Text(
          type == AppStrings.populareScreenType
              ? 'Populare Movies'
              : 'Top Rated Movies',
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => type == AppStrings.populareScreenType
            ? (ls<MoviesBloc>()..add(GetPopularMoviesEven()))
            : (ls<MoviesBloc>()..add(GetTopRateMoviesEven())),
        child: BlocBuilder<MoviesBloc, BaseState>(
          builder: (context, state) {
            if (state is MovieErrorState) {
              return const Center(
                  child: Text(
                'you have Error',
                style: TextStyle(color: Colors.white),
              ));
            } else if (state is MovieLoadedState) {
              List<Movie> movie = state.movie;

              return ListView.builder(
                  itemCount: movie.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(id: movie[index].id))),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(48, 48, 60, 1),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  imageUrl: ApiManegar.imageUrl(
                                      movie[index].backdropPath),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      movie[index].title.length > 23
                                          ? '${movie[index].title.substring(0, 23)}...'
                                          : movie[index].title,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.0,
                                              horizontal: 8.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              movie[index]
                                                  .releaseTime
                                                  .split('-')[0],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16.0),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            (movie[index].voteAverage / 2)
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            '(${movie[index].voteAverage})',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 1.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        movie[index].overView.length > 80
                                            ? '${movie[index].overView.substring(0, 70)}...'
                                            : movie[index].overView,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
