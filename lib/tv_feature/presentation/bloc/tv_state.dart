import 'package:equatable/equatable.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';

sealed class TvState extends Equatable {
  const TvState();

  @override
  List<Object> get props => [];
}

final class TvInitial extends TvState {}

final class TvErrorState extends TvState {
  final String message;

  const TvErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

final class TvLoadingState extends TvState {}

final class TvLoadedState extends TvState {
  final List<Tv> tv;

  const TvLoadedState({required this.tv});
  @override
  List<Object> get props => [tv];
}

final class TvDetailsLoadedState extends TvState {
  final Tv tv;

  const TvDetailsLoadedState({required this.tv});
  @override
  List<Object> get props => [tv];
}

final class TvRemommendationLoadedState extends TvState {
  final List<Tv> tv;

  const TvRemommendationLoadedState({required this.tv});
  @override
  List<Object> get props => [tv];
}
