import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

class GetTvDetailsUsecase extends Usecase<Tv, int> {
  final TvRepository tvRepository;

  GetTvDetailsUsecase({required this.tvRepository});
  @override
  Future<Either<FailureApp, Tv>> call(int parameter) async {
    return await tvRepository.getTvDetails(parameter);
  }
}
