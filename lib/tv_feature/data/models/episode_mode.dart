import 'package:movies_app/tv_feature/domain/entities/episode.dart';

class EpisodeMode extends Episode {
  EpisodeMode(
      {required super.id,
      required super.airDate,
      required super.name,
      required super.overview,
      required super.runTime,
      required super.seasonNumber,
      required super.stillPath,
      required super.voteAverage});

  factory EpisodeMode.fromJson(Map<String, dynamic> json) {
    return EpisodeMode(
        id: json['id'],
        airDate: json['air_date'],
        name: json['name'],
        overview: json['overview'],
        runTime: json['runtime'],
        seasonNumber: json['season_number'],
        stillPath: json['still_path'],
        voteAverage: json['vote_average']);
  }
}
