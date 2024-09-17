import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/tv_feature/data/data_source/remote_tv_data_source.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';
import 'package:movies_app/tv_feature/domain/entities/season.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_episode_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';

class TvRepositoryImpl implements TvRepository {
  final RemoteTvDataSource remoteTvDataSource;

  TvRepositoryImpl({required this.remoteTvDataSource});

  @override
  Future<Either<FailureApp, List<Tv>>> getOnTheAirTv() async {
    try {
      final result = await remoteTvDataSource.getOnTheAirTv();
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, List<Tv>>> getPopularTv() async {
    try {
      final result = await remoteTvDataSource.getPopulareTv();
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, List<Tv>>> getTopRateTv() async {
    try {
      final result = await remoteTvDataSource.getTopRateTv();
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, Tv>> getTvDetails(int id) async {
    final result = await remoteTvDataSource.getTvDetails(id);
    try {
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, List<Tv>>> getRecommendationTv(int id) async {
    final result = await remoteTvDataSource.getRecommendationTv(id);
    try {
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, Episode>> getEpisodeDetails(
      EpisodeParameter parameter) async {
    final result = await remoteTvDataSource.getEpisodeDetails(parameter);
    try {
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<FailureApp, Season>> getSeasonDetails(
      SeasonParameter parameter) async {
    final result = await remoteTvDataSource.getSeasonDetails(parameter);
    try {
      return right(result);
    } on ExceptionsApp catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
