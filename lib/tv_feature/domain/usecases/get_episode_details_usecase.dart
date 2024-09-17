import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';

class GetEpisodeDetailsUsecase extends Usecase<Episode, EpisodeParameter> {
  final TvRepository tvRepository;

  GetEpisodeDetailsUsecase({required this.tvRepository});
  @override
  Future<Either<FailureApp, Episode>> call(EpisodeParameter parameter) async {
    return await tvRepository.getEpisodeDetails(parameter);
  }
}

class EpisodeParameter {
  final int episodeNumer;
  final int seasonNumber;
  final int tvId;

  EpisodeParameter(
      {required this.episodeNumer,
      required this.seasonNumber,
      required this.tvId});
}
