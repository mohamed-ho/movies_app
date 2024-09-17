import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_details_repository.dart';

class GetMovieDetailsUsecase extends Usecase<MovieDetails, int> {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsUsecase({required this.movieDetailsRepository});
  @override
  Future<Either<FailureApp, MovieDetails>> call(int parameter) async {
    return await movieDetailsRepository.getMovieDetails(parameter);
  }
}
