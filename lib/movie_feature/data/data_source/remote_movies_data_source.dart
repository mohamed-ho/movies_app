import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movie_feature/data/models/movie_model.dart';

abstract class RemoteMoviesDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRateMovies();
}

class RemoteMoviesDataSourceImpl implements RemoteMoviesDataSource {
  final Dio client;

  RemoteMoviesDataSourceImpl({required this.client});
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(AppStrings.getNowPlayingMoviesURL);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: response.statusMessage!);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(AppStrings.getPopularMoviesURL);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: response.statusMessage!);
    }
  }

  @override
  Future<List<MovieModel>> getTopRateMovies() async {
    final response = await client.get(AppStrings.getTopRateMoviesURL);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeptions(message: response.statusMessage!);
    }
  }
}
