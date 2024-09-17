part of 'season_and_episode_bloc.dart';

sealed class SeasonAndEpisodeEvent extends Equatable {
  const SeasonAndEpisodeEvent();

  @override
  List<Object> get props => [];
}

class GetSeasonEvent extends SeasonAndEpisodeEvent {
  final SeasonParameter parameter;

  GetSeasonEvent({required this.parameter});
  @override
  List<Object> get props => [parameter];
}

class ShowSessonNumber extends SeasonAndEpisodeEvent {}

class GetEpisodeEvent extends SeasonAndEpisodeEvent {
  final EpisodeParameter parameter;

  GetEpisodeEvent({required this.parameter});
  @override
  List<Object> get props => [parameter];
}
