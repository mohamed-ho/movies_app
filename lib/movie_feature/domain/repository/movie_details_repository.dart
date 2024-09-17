import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<Either<FailureApp, MovieDetails>> getMovieDetails(int parameter);
}
