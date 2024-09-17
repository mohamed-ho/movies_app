import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

class GetRecommendationTvUsecase extends Usecase<List<Tv>, int> {
  final TvRepository tvRepository;

  GetRecommendationTvUsecase({required this.tvRepository});

  @override
  Future<Either<FailureApp, List<Tv>>> call(int parameter) {
    return tvRepository.getRecommendationTv(parameter);
  }
}
