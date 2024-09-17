// ignore: file_names

import 'package:movies_app/movie_feature/domain/entities/recommendation_movies.dart';

class RecommendationMoviesModel extends RecommendationMovies {
  const RecommendationMoviesModel(
      {required super.id, required super.posterPath});
  factory RecommendationMoviesModel.fromJson(Map<String, dynamic> json) {
    return RecommendationMoviesModel(
        id: json['id'], posterPath: json['poster_path']);
  }
}
