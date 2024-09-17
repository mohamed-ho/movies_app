import 'package:equatable/equatable.dart';

sealed class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class OnTheAirTvEvent extends TvEvent {}

class PopulareTvEvent extends TvEvent {}

class TopRateTvEvent extends TvEvent {}
