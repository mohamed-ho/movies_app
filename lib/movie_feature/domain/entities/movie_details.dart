import 'package:equatable/equatable.dart';
import 'package:movies_app/movie_feature/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final String title;
  final int runTime;
  final double voteRate;
  final String releaseTime;
  final String overview;
  final List<Genres> genres;
  final int id;

  const MovieDetails(
      {required this.backDropPath,
      required this.title,
      required this.runTime,
      required this.voteRate,
      required this.releaseTime,
      required this.overview,
      required this.genres,
      required this.id});

  @override
  List<Object?> get props => [
        backDropPath,
        title,
        runTime,
        voteRate,
        releaseTime,
        overview,
        genres,
        id
      ];
}
