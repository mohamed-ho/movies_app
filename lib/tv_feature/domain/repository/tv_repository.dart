import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';
import 'package:movies_app/tv_feature/domain/entities/season.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_episode_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';

abstract class TvRepository {
  Future<Either<FailureApp, List<Tv>>> getOnTheAirTv();
  Future<Either<FailureApp, List<Tv>>> getPopularTv();
  Future<Either<FailureApp, List<Tv>>> getTopRateTv();
  Future<Either<FailureApp, Tv>> getTvDetails(int id);
  Future<Either<FailureApp, List<Tv>>> getRecommendationTv(int id);
  Future<Either<FailureApp, Season>> getSeasonDetails(
      SeasonParameter parameter);
  Future<Either<FailureApp, Episode>> getEpisodeDetails(
      EpisodeParameter parameter);
}
