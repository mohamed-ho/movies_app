import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movie_feature/domain/entities/recommendation_movies.dart';

abstract class RecommendationMoviesRepository {
  Future<Either<FailureApp, List<RecommendationMovies>>>
      getRecommendationMovies(int movieId);
}
