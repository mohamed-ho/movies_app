part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GetRecommendationMoviesEvent extends MovieDetailsEvent {
  final int id;

  const GetRecommendationMoviesEvent({required this.id});
  @override
  List<Object> get props => [id];
}
