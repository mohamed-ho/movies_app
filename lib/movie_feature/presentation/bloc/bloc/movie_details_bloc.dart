// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';
import 'package:movies_app/movie_feature/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetails;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;
  MovieDetailsBloc(
      {required this.getMovieDetails,
      required this.getRecommendationMoviesUsecase})
      : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetails(event.id);
      result.fold(
          (l) => emit(MovieDetailsErrorState(
                message: l.message,
              )),
          (r) => emit(MovieDetailsLoadedState(movieDetails: r)));
    });

    on<GetRecommendationMoviesEvent>((event, emit) async {
      final result = await getRecommendationMoviesUsecase(event.id);
      result.fold(
          (l) => emit(RecommendationMoviesErrorState(message: l.message)),
          (r) =>
              emit(RecommendationMoviesLoadedState(recommendationMovies: r)));
    });
  }
}
