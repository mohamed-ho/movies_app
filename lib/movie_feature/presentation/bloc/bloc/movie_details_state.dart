part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoadingState extends MovieDetailsState {}

final class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsLoadedState({required this.movieDetails});
  @override
  List<Object> get props => [movieDetails];
}

final class MovieDetailsErrorState extends MovieDetailsState {
  final String message;

  const MovieDetailsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

final class RecommendationMoviesLoadingState extends MovieDetailsState {}

final class RecommendationMoviesLoadedState extends MovieDetailsState {
  final List<RecommendationMovies> recommendationMovies;

  const RecommendationMoviesLoadedState({required this.recommendationMovies});
  @override
  List<Object> get props => [recommendationMovies];
}

final class RecommendationMoviesErrorState extends MovieDetailsState {
  final String message;

  const RecommendationMoviesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
