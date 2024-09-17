// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class MoviesEven extends Equatable {
  const MoviesEven();
  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEven extends MoviesEven {}

class GetPopularMoviesEven extends MoviesEven {}

class GetTopRateMoviesEven extends MoviesEven {}
