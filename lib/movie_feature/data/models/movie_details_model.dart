import 'package:movies_app/movie_feature/data/models/genres_model.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backDropPath,
      required super.title,
      required super.runTime,
      required super.voteRate,
      required super.releaseTime,
      required super.overview,
      required super.genres,
      required super.id});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backDropPath: json['backdrop_path'],
        title: json['title'],
        runTime: json['runtime'],
        voteRate: json['vote_average'],
        releaseTime: json['release_date'],
        overview: json['overview'],
        genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.fromJson(e))),
        id: json['id']);
  }
}
