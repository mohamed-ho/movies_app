import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<FailureApp, List<Movie>>> getNowPlayingMovies();
  Future<Either<FailureApp, List<Movie>>> getPopularMovies();
  Future<Either<FailureApp, List<Movie>>> getTopRateMovies();
}
