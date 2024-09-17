import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String? airDate;
  final String? name;
  final String? overview;
  final int? runTime;
  final int? seasonNumber;
  final String? stillPath;
  final double voteAverage;

  Episode(
      {required this.id,
      required this.airDate,
      required this.name,
      required this.overview,
      required this.runTime,
      required this.seasonNumber,
      required this.stillPath,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        id,
        airDate,
        name,
        overview,
        runTime,
        seasonNumber,
        stillPath,
        voteAverage
      ];
}
