import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:movies_app/tv_feature/data/models/episode_mode.dart';
import 'package:movies_app/tv_feature/data/models/season_mode.dart';
import 'package:movies_app/tv_feature/data/models/tv_model.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_episode_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';

abstract class RemoteTvDataSource {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopulareTv();
  Future<List<TvModel>> getTopRateTv();
  Future<TvModel> getTvDetails(int id);
  Future<List<TvModel>> getRecommendationTv(int id);
  Future<EpisodeMode> getEpisodeDetails(EpisodeParameter parameter);
  Future<SeasonMode> getSeasonDetails(SeasonParameter parameter);
}

class RemoteTvDataSourceImpl implements RemoteTvDataSource {
  final Dio dio;

  RemoteTvDataSourceImpl({required this.dio});
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final result = await dio.get(ApiConstant.onTheAirTv);
    if (result.statusCode == 200) {
      return List<TvModel>.from(
          result.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }

  @override
  Future<List<TvModel>> getPopulareTv() async {
    final result = await dio.get(ApiConstant.populareTv);
    if (result.statusCode == 200) {
      return List<TvModel>.from(
          result.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }

  @override
  Future<List<TvModel>> getTopRateTv() async {
    final result = await dio.get(ApiConstant.topRateTv);
    if (result.statusCode == 200) {
      return List<TvModel>.from(
          result.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }

  @override
  Future<TvModel> getTvDetails(int id) async {
    final result =
        await dio.get(ApiConstant.tvURL + id.toString() + ApiConstant.apiKey);
    if (result.statusCode == 200) {
      return TvModel.fromJson(result.data);
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }

  @override
  Future<List<TvModel>> getRecommendationTv(int id) async {
    final result = await dio.get(ApiConstant.tvURL +
        id.toString() +
        ApiConstant.recommendationURL +
        ApiConstant.apiKey);
    if (result.statusCode == 200) {
      return List<TvModel>.from(
          result.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }

  @override
  Future<EpisodeMode> getEpisodeDetails(EpisodeParameter parameter) async {
    final result = await dio.get(_getEpisoderPath(parameter));

    if (result.statusCode == 200)
      return EpisodeMode.fromJson(result.data);
    else
      throw ServerExeptions(message: result.statusMessage!);
  }

  @override
  Future<SeasonMode> getSeasonDetails(SeasonParameter parameter) async {
    final result = await dio.get(_getSeasonPath(parameter));
    if (result.statusCode == 200)
      return SeasonMode.fromJson(result.data);
    else
      throw ServerExeptions(message: result.statusMessage!);
  }
}

String _getEpisoderPath(EpisodeParameter parameter) {
  return ApiConstant.tvURL +
      parameter.tvId.toString() +
      '/season/' +
      parameter.seasonNumber.toString() +
      '/episode/' +
      parameter.episodeNumer.toString() +
      ApiConstant.apiKey;
}

String _getSeasonPath(SeasonParameter parameter) {
  return ApiConstant.tvURL +
      parameter.tvId.toString() +
      '/season/' +
      parameter.seasonNumber.toString() +
      ApiConstant.apiKey;
}
