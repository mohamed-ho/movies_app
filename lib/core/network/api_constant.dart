class ApiConstant {
  static const String baseURL = 'https://api.themoviedb.org/3/';
  static const String movieURL = 'movie/';
  static const String movieDetailsURL = '$baseURL$movieURL';
  static const String recommendationURL = '/recommendations';
  static const String apiKey = '?api_key=c723093f820383043105db17f03dc13d';
  static const String tvURL = '${baseURL}tv/';
  static const String onTheAirTv = '${tvURL}on_the_air$apiKey';
  static const String populareTv = '${tvURL}popular$apiKey';
  static const String topRateTv = '${tvURL}top_rated$apiKey';
}
