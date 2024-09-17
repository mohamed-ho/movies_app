import 'package:movies_app/movie_feature/data/models/genres_model.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.name,
      required super.overView,
      required super.posterPath,
      required super.voteAverage,
      required super.voteCount,
      required super.firstAirDate,
      required super.numberOfSeason});

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
        backdropPath: json['backdrop_path'],
        genres: json.containsKey('genres')
            ? List.from(json['genres'].map((e) => GenresModel.fromJson(e)))
            : [],
        id: json['id'],
        name: json['name'],
        overView: json['overview'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        firstAirDate: json['first_air_date'],
        numberOfSeason: json['number_of_seasons']);
  }
}
