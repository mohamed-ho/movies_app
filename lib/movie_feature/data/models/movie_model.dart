import 'package:movies_app/movie_feature/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.backdropPath,
      required super.generId,
      required super.id,
      required super.title,
      required super.overView,
      required super.posterPath,
      required super.voteAverage,
      required super.voteCount,
      required super.releaseTime});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        backdropPath: json['backdrop_path'],
        generId: List<int>.from(json['genre_ids'].map((e) => e)),
        id: json['id'],
        title: json['title'],
        overView: json['overview'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        releaseTime: json['release_date']);
  }
}
