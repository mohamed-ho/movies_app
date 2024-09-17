import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_recommendation_movies_data_source.dart';
import 'package:movies_app/movie_feature/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movie_feature/domain/repository/recommendation_movies_repository.dart';

class RecommendationMoviesRepositoryImpl
    implements RecommendationMoviesRepository {
  final RemoteRecommendationMoviesDataSource recommendationMoviesDataSource;

  RecommendationMoviesRepositoryImpl(
      {required this.recommendationMoviesDataSource});

  @override
  Future<Either<FailureApp, List<RecommendationMovies>>>
      getRecommendationMovies(int movieId) async {
    try {
      final result =
          await recommendationMoviesDataSource.getRecommendationMovies(movieId);
      return Right(result);
    } on ServerExeptions catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
