import 'package:equatable/equatable.dart';

class RecommendationMovies extends Equatable {
  final int id;
  final String posterPath;

  const RecommendationMovies({required this.id, required this.posterPath});

  @override
  List<Object?> get props => [id, posterPath];
}
