import 'package:movies_app/tv_feature/data/models/episode_mode.dart';
import 'package:movies_app/tv_feature/domain/entities/season.dart';

class SeasonMode extends Season {
  SeasonMode(
      {required super.id,
      required super.name,
      required super.airDate,
      required super.episodes,
      required super.overView,
      required super.seasonNumber,
      required super.voteAverage});

  factory SeasonMode.fromJson(Map<String, dynamic> json) {
    return SeasonMode(
        id: json['id'],
        name: json['name'],
        airDate: json['air_date'],
        episodes: List<EpisodeMode>.from(
            json['episodes'].map((e) => EpisodeMode.fromJson(e))),
        overView: json['overview'],
        seasonNumber: json['season_number'],
        voteAverage: json['vote_average']);
  }
}
