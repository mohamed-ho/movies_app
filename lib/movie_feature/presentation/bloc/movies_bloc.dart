import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_now_Playing_movies_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_populare_movies_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_top_rate_movies_usecase.dart';
import 'package:movies_app/movie_feature/presentation/bloc/Movies_even.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEven, BaseState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopulareMoviesUsecase getPopulareMoviesUsecase;
  final GetTopRateMoviesUsecase getTopRateMoviesUsecase;
  MoviesBloc(
      {required this.getNowPlayingMoviesUsecase,
      required this.getPopulareMoviesUsecase,
      required this.getTopRateMoviesUsecase})
      : super(MovieInitialState()) {
    on<GetNowPlayingMoviesEven>((even, emit) async {
      final resut = await getNowPlayingMoviesUsecase(NoParam());
      resut.fold((l) => emit(MovieErrorState(message: l.message)),
          (r) => emit(MovieLoadedState(movie: r)));
    });

    on<GetPopularMoviesEven>((even, emit) async {
      final resut = await getPopulareMoviesUsecase.call(NoParam());
      resut.fold((l) => emit(MovieErrorState(message: l.message)),
          (r) => emit(MovieLoadedState(movie: r)));
    });

    on<GetTopRateMoviesEven>((even, emit) async {
      final resut = await getTopRateMoviesUsecase.call(NoParam());
      resut.fold((l) => emit(MovieErrorState(message: l.message)),
          (r) => emit(MovieLoadedState(movie: r)));
    });
  }

  // Future<void> getNowPlayingMovies() async {
  //   emit(MovieLoadingState());
  //   final result = await getNowPlayingMoviesUsecase.execute();
  //   emit(result.fold((l) => MovieErrorState(message: l.message),
  //       (r) => MovieLoadedState(movie: r)));
  // }

  // Future<void> getPopularMovies() async {
  //   emit(MovieLoadingState());
  //   final result = await getPopulareMoviesUsecase.execute();
  //   emit(result.fold((l) => MovieErrorState(message: l.message),
  //       (r) => MovieLoadedState(movie: r)));
  // }

  // Future<void> getToprateMovies() async {
  //   emit(MovieLoadingState());
  //   final result = await getTopRateMoviesUsecase.execute();
  //   emit(result.fold((l) => MovieErrorState(message: l.message),
  //       (r) => MovieLoadedState(movie: r)));
  // }
}


// class MoviesBloc extends Bloc<MoviesEven, MoviesState> {
//   final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
//   final GetPopulareMoviesUsecase getPopulareMoviesUsecase;
//   final GetTopRateMoviesUsecase getTopRateMoviesUsecase;
//   MoviesBloc(
//       {required this.getNowPlayingMoviesUsecase,
//       required this.getPopulareMoviesUsecase,
//       required this.getTopRateMoviesUsecase})
//       : super(MoviesState()) {
//     on<GetNowPlayingMoviesEven>(
//       _playingMoviesState,
//     );

//     on<GetPopularMoviesEven>(_populareMoviesState);

//     on<GetTopRateMoviesEven>(
//       _topRateMoviesState,
//     );
//   }

//   FutureOr<void> _topRateMoviesState(event, emit) async {
//     final result = await getTopRateMoviesUsecase.execute();
//     result.fold(
//         (left) => emit(MoviesState(
//             topRateMovieState: MoviesStates.error,
//             topRateMsssage: left.message)),
//         (right) => emit(MoviesState(
//             topRateMovieState: MoviesStates.loaded, topRateMovies: right)));
//   }

//   FutureOr<void> _populareMoviesState(even, emit) async {
//     final result = await getPopulareMoviesUsecase.execute();
//     result.fold(
//         (left) => emit(MoviesState(
//             populareMovieState: MoviesStates.error,
//             populareMsssage: left.message)),
//         (right) => emit(MoviesState(
//             populareMovieState: MoviesStates.loaded, populareMovies: right)));
//   }

//   FutureOr<void> _playingMoviesState(event, emit) async {
//     final result = await getNowPlayingMoviesUsecase.execute();
//     result.fold(
//         (l) => emit(MoviesState(
//             nowPlayingMoviesStates: MoviesStates.error,
//             nowPlayingMessage: l.message)),
//         (r) => emit(MoviesState(
//             nowPlayingMoviesStates: MoviesStates.loaded, nowPlayignMovies: r)));
//   }
// }
