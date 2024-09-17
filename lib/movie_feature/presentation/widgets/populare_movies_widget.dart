import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_manegar.dart';

import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';
import 'package:movies_app/movie_feature/presentation/bloc/Movies_even.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_state.dart';
import 'package:movies_app/movie_feature/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopulareMoviesWidget extends StatelessWidget {
  const PopulareMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => ls<MoviesBloc>()..add(GetPopularMoviesEven()),
      child: BlocBuilder<MoviesBloc, BaseState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is MovieErrorState) {
            return const Center(
              child: Text('you have Error'),
            );
          } else if (state is MovieLoadedState) {
            List<Movie> moviesList = state.movie;
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
                                  builder: (context) => MovieDetailScreen(
                                      id: moviesList[index].id)));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiManegar.imageUrl(movie.backdropPath),
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
