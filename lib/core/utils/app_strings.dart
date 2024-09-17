class AppStrings {
  static const String baseURL = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'api_key=c723093f820383043105db17f03dc13d';
  static const String getNowPlayingMoviesURL =
      '${baseURL}movie/now_playing?$apiKey';
  static const String getPopularMoviesURL = '${baseURL}movie/popular?$apiKey';
  static const String getTopRateMoviesURL = '${baseURL}movie/top_rated?$apiKey';
  static const String populareScreenType = 'populare';
  static const String topRateScreenType = 'TopRate';
  static const String nowPlayingMovieType = 'NOWPLAYINGMOVIETYPE';
  static const String nowPlayingTVType = 'NOWPLAYINGTVTYPE';
}
