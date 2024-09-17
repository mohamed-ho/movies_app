import 'package:dartz/dartz.dart';

import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

import '../../../core/usecase/usecase.dart';

class GetOnTheAirTvUsecase extends Usecase<List<Tv>, NoParam> {
  final TvRepository tvRepository;

  GetOnTheAirTvUsecase({required this.tvRepository});
  @override
  Future<Either<FailureApp, List<Tv>>> call(parameter) async {
    return await tvRepository.getOnTheAirTv();
  }
}
