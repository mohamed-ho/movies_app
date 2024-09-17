import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/movie_feature/domain/entities/movie.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_repository.dart';

class GetTopRateMoviesUsecase extends Usecase<List<Movie>, NoParam> {
  final MovieRepository movieRepository;

  GetTopRateMoviesUsecase({required this.movieRepository});

  @override
  Future<Either<FailureApp, List<Movie>>> call(NoParam parameter) async {
    return await movieRepository.getTopRateMovies();
  }
}
