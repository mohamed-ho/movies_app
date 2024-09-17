import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:movies_app/movie_feature/data/models/Recommendation_movies_model.dart';

abstract class RemoteRecommendationMoviesDataSource {
  Future<List<RecommendationMoviesModel>> getRecommendationMovies(int movieId);
}

class RemoteRecommendationMoviesDataSourceImpl
    implements RemoteRecommendationMoviesDataSource {
  final Dio dio;

  RemoteRecommendationMoviesDataSourceImpl({required this.dio});
  @override
  Future<List<RecommendationMoviesModel>> getRecommendationMovies(
      int movieId) async {
    final result = await dio.get(ApiConstant.movieDetailsURL +
        movieId.toString() +
        ApiConstant.recommendationURL +
        ApiConstant.apiKey);
    if (result.statusCode == 200) {
      return List<RecommendationMoviesModel>.from(result.data['results']
          .map((e) => RecommendationMoviesModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }
}
