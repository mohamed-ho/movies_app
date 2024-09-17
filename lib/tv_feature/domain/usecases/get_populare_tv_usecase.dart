import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

class GetPopulareTvUsecase extends Usecase<List<Tv>, NoParam> {
  final TvRepository tvRepository;

  GetPopulareTvUsecase({required this.tvRepository});
  @override
  Future<Either<FailureApp, List<Tv>>> call(NoParam parameter) async {
    return await tvRepository.getPopularTv();
  }
}
