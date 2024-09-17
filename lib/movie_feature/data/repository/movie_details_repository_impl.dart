import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_movies_details_data_source.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final RemoteMoviesDetailsDataSource remoteMoviesDetailsDataSource;

  MovieDetailsRepositoryImpl({required this.remoteMoviesDetailsDataSource});
  @override
  Future<Either<FailureApp, MovieDetails>> getMovieDetails(
      int parameter) async {
    final result =
        await remoteMoviesDetailsDataSource.getMovieDetails(parameter);
    try {
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
