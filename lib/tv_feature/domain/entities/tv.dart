import 'package:equatable/equatable.dart';
import 'package:movies_app/movie_feature/domain/entities/genres.dart';

class Tv extends Equatable {
  final String? backdropPath;
  final List<Genres>? genres;
  final int id;
  final String? name;
  final String? overView;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final String? firstAirDate;
  final int? numberOfSeason;
  const Tv(
      {required this.backdropPath,
      required this.genres,
      required this.id,
      required this.name,
      required this.overView,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      required this.firstAirDate,
      required this.numberOfSeason});

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        name,
        overView,
        posterPath,
        voteAverage,
        voteCount,
        firstAirDate,
        numberOfSeason
      ];
}
