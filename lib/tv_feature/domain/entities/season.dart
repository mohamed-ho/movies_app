import 'package:equatable/equatable.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';

class Season extends Equatable {
  final int id;
  final String name;
  final String? airDate;
  final List<Episode> episodes;
  final String overView;
  final int seasonNumber;
  final voteAverage;
  Season({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodes,
    required this.overView,
    required this.seasonNumber,
    required this.voteAverage,
  });
  @override
  List<Object?> get props =>
      [id, name, airDate, episodes, overView, seasonNumber, voteAverage];
}
