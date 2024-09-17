import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/tv_feature/domain/entities/season.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

class GetSeasonDetailsUsecase extends Usecase<Season, SeasonParameter> {
  final TvRepository tvRepository;

  GetSeasonDetailsUsecase({required this.tvRepository});

  @override
  Future<Either<FailureApp, Season>> call(SeasonParameter parameter) async {
    return await tvRepository.getSeasonDetails(parameter);
  }
}

class SeasonParameter {
  final int tvId;
  final int seasonNumber;

  SeasonParameter({required this.tvId, required this.seasonNumber});
}
