import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final List<int> generId;
  final int id;
  final String title;
  final String overView;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String releaseTime;

  const Movie(
      {required this.backdropPath,
      required this.generId,
      required this.id,
      required this.title,
      required this.overView,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount,
      required this.releaseTime});

  @override
  List<Object?> get props => [
        backdropPath,
        generId,
        id,
        title,
        overView,
        posterPath,
        voteAverage,
        voteCount,
        releaseTime
      ];
}
