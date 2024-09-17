import 'package:equatable/equatable.dart';

sealed class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class OnTheAirTvEvent extends TvEvent {}

class PopulareTvEvent extends TvEvent {}

class TopRateTvEvent extends TvEvent {}

class DetailsTvEvent extends TvEvent {
  final int id;

  const DetailsTvEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class RefreshEvent extends TvEvent {
  final int id;

  const RefreshEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class RecommendationTvEvent extends TvEvent {
  final int id;

  const RecommendationTvEvent({required this.id});
  @override
  List<Object> get props => [id];
}
