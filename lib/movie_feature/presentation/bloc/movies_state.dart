import 'package:equatable/equatable.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';

//ignore: must_be_immutable
// class MoviesState extends Equatable {
//   List<Movie> nowPlayignMovies;
//   MoviesStates nowPlayingMoviesStates;
//   String nowPlayingMessage;
//   List<Movie> populareMovies;
//   MoviesStates populareMovieState;
//   String populareMsssage;
//   List<Movie> topRateMovies;
//   MoviesStates topRateMovieState;
//   String topRateMsssage;

//   MoviesState(
//       {this.nowPlayingMessage = '',
//       this.nowPlayignMovies = const [],
//       this.nowPlayingMoviesStates = MoviesStates.loading,
//       this.populareMovieState = MoviesStates.loading,
//       this.populareMovies = const [],
//       this.populareMsssage = '',
//       this.topRateMovieState = MoviesStates.loading,
//       this.topRateMovies = const [],
//       this.topRateMsssage = ''});

//   @override
//   List<Object?> get props => [
//         nowPlayignMovies,
//         nowPlayingMoviesStates,
//         nowPlayingMessage,
//         populareMovies,
//         populareMovieState,
//         populareMsssage,
//         topRateMovies,
//         topRateMovieState,
//         topRateMsssage
//       ];
// }

abstract class BaseState extends Equatable {
  const BaseState();
  @override
  List<Object?> get props => [];
}

class MovieInitialState extends BaseState {}

class MovieLoadingState extends BaseState {}

class MovieLoadedState extends BaseState {
  final List<Movie> movie;

  const MovieLoadedState({required this.movie});
  @override
  List<Object?> get props => [movie];
}

class MovieErrorState extends BaseState {
  final String message;

  const MovieErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
