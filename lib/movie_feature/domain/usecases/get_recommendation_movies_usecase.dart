import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/movie_feature/domain/entities/recommendation_movies.dart';
import 'package:movies_app/movie_feature/domain/repository/recommendation_movies_repository.dart';

class GetRecommendationMoviesUsecase
    implements Usecase<List<RecommendationMovies>, int> {
  final RecommendationMoviesRepository recommendationMoviesRepository;

  GetRecommendationMoviesUsecase(
      {required this.recommendationMoviesRepository});

  @override
  Future<Either<FailureApp, List<RecommendationMovies>>> call(
      int parameter) async {
    return await recommendationMoviesRepository
        .getRecommendationMovies(parameter);
  }
}
