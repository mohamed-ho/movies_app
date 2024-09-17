import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_movies_data_source.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_repository.dart';

class MoviesRepoitoryImpl implements MovieRepository {
  final RemoteMoviesDataSource remoteMoviesDataSource;

  MoviesRepoitoryImpl({required this.remoteMoviesDataSource});
  @override
  Future<Either<FailureApp, List<Movie>>> getNowPlayingMovies() async {
    final result = await remoteMoviesDataSource.getNowPlayingMovies();
    try {
      return right(result);
    } on ServerExeptions catch (excuption) {
      return left(ServerFailure(message: excuption.message));
    }
  }

  @override
  Future<Either<FailureApp, List<Movie>>> getPopularMovies() async {
    final result = await remoteMoviesDataSource.getPopularMovies();
    try {
      return right(result);
    } on ExceptionsApp catch (exception) {
      return left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<FailureApp, List<Movie>>> getTopRateMovies() async {
    final result = await remoteMoviesDataSource.getTopRateMovies();
    try {
      return right(result);
    } on ExceptionsApp catch (exception) {
      return left(ServerFailure(message: exception.message));
    }
  }
}
