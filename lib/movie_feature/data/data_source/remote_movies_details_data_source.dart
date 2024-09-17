import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:movies_app/movie_feature/data/models/movie_details_model.dart';
import 'package:movies_app/movie_feature/domain/entities/movie_details.dart';

abstract class RemoteMoviesDetailsDataSource {
  Future<MovieDetails> getMovieDetails(int movieId);
}

class RemoteMoviesDetailsDataSourceImpl
    implements RemoteMoviesDetailsDataSource {
  final Dio dio;

  RemoteMoviesDetailsDataSourceImpl({required this.dio});
  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final result = await dio.get(
        ApiConstant.movieDetailsURL + movieId.toString() + ApiConstant.apiKey);
    if (result.statusCode == 200) {
      return MovieDetailsModel.fromJson(result.data);
    } else {
      throw ServerExeptions(message: result.statusMessage!);
    }
  }
}
