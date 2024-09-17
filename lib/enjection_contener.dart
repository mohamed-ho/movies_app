import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_movies_data_source.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_movies_details_data_source.dart';
import 'package:movies_app/movie_feature/data/data_source/remote_recommendation_movies_data_source.dart';
import 'package:movies_app/tv_feature/data/data_source/remote_tv_data_source.dart';
import 'package:movies_app/movie_feature/data/repository/movie_details_repository_impl.dart';
import 'package:movies_app/movie_feature/data/repository/movie_repository_impl.dart';
import 'package:movies_app/movie_feature/data/repository/recommendation_movies_repository_impl.dart';
import 'package:movies_app/tv_feature/data/repository/tv_repository_impl.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_details_repository.dart';
import 'package:movies_app/movie_feature/domain/repository/movie_repository.dart';
import 'package:movies_app/movie_feature/domain/repository/recommendation_movies_repository.dart';
import 'package:movies_app/tv_feature/domain/repository/tv_repository.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_now_Playing_movies_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_episode_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_on_the_air_tv_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_populare_movies_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_populare_tv_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movies_app/movie_feature/domain/usecases/get_top_rate_movies_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_recommendation_tv_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_top_rate_tv_usecase.dart';
import 'package:movies_app/movie_feature/presentation/bloc/bloc/movie_details_bloc.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_tv_details_usecase.dart';
import 'package:movies_app/tv_feature/presentation/bloc/bloc/season_and_episode_bloc.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_bloc.dart';
import 'package:movies_app/movie_feature/presentation/bloc/movies_bloc.dart';

final ls = GetIt.instance;

class EnjectionContener {
  void init() {
    // bloc
    ls.registerFactory(() => MoviesBloc(
        getNowPlayingMoviesUsecase: ls(),
        getPopulareMoviesUsecase: ls(),
        getTopRateMoviesUsecase: ls()));
    ls.registerFactory(() => TvBloc(
        getOnTheAirTvUsecase: ls(),
        getPopulareTvUsecase: ls(),
        getTopRateTvUsecase: ls(),
        getTvDetailsUsecase: ls(),
        getRecommendationTvUsecase: ls()));
    ls.registerFactory(() => MovieDetailsBloc(
        getMovieDetails: ls(), getRecommendationMoviesUsecase: ls()));
    ls.registerFactory(() => SeasonAndEpisodeBloc(
        getEpisodeDetailsUsecase: ls(), getSeasonDetailsUsecase: ls()));
    //userCases
    ls.registerLazySingleton(
        () => GetNowPlayingMoviesUsecase(movieRepository: ls()));
    ls.registerLazySingleton(
        () => GetPopulareMoviesUsecase(movieRepository: ls()));
    ls.registerLazySingleton(
        () => GetTopRateMoviesUsecase(movieRepository: ls()));
    ls.registerLazySingleton(
        () => GetMovieDetailsUsecase(movieDetailsRepository: ls()));
    ls.registerLazySingleton(() =>
        GetRecommendationMoviesUsecase(recommendationMoviesRepository: ls()));
    ls.registerLazySingleton(() => GetOnTheAirTvUsecase(tvRepository: ls()));
    ls.registerLazySingleton(() => GetPopulareTvUsecase(tvRepository: ls()));
    ls.registerLazySingleton(() => GetTopRateTvUsecase(tvRepository: ls()));
    ls.registerLazySingleton(() => GetTvDetailsUsecase(tvRepository: ls()));
    ls.registerLazySingleton(
        () => GetRecommendationTvUsecase(tvRepository: ls()));
    ls.registerLazySingleton(() => GetSeasonDetailsUsecase(tvRepository: ls()));
    ls.registerLazySingleton(
        () => GetEpisodeDetailsUsecase(tvRepository: ls()));
    // repositorys
    ls.registerLazySingleton<MovieRepository>(
        () => MoviesRepoitoryImpl(remoteMoviesDataSource: ls()));
    ls.registerLazySingleton<MovieDetailsRepository>(
        () => MovieDetailsRepositoryImpl(remoteMoviesDetailsDataSource: ls()));
    ls.registerLazySingleton<RecommendationMoviesRepository>(() =>
        RecommendationMoviesRepositoryImpl(
            recommendationMoviesDataSource: ls()));
    ls.registerLazySingleton<TvRepository>(
        () => TvRepositoryImpl(remoteTvDataSource: ls()));

    // data Source

    ls.registerLazySingleton<RemoteMoviesDataSource>(
        () => RemoteMoviesDataSourceImpl(client: ls()));
    ls.registerLazySingleton<RemoteMoviesDetailsDataSource>(
        () => RemoteMoviesDetailsDataSourceImpl(dio: ls()));
    ls.registerLazySingleton<RemoteRecommendationMoviesDataSource>(
        () => RemoteRecommendationMoviesDataSourceImpl(dio: ls()));
    ls.registerLazySingleton<RemoteTvDataSource>(
        () => RemoteTvDataSourceImpl(dio: ls()));
    ls.registerFactory(() => Dio());
  }
}
