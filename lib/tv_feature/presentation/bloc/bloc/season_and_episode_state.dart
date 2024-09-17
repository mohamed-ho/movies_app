part of 'season_and_episode_bloc.dart';

sealed class SeasonAndEpisodeState extends Equatable {
  const SeasonAndEpisodeState();

  @override
  List<Object> get props => [];
}

final class SeasonAndEpisodeInitial extends SeasonAndEpisodeState {}

final class SeasonAndEpisodeErrorState extends SeasonAndEpisodeState {
  final String message;

  SeasonAndEpisodeErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

final class SeasonAndEpisodeLoadingState extends SeasonAndEpisodeState {}

final class SeasonLoadedState extends SeasonAndEpisodeState {
  final Season season;

  SeasonLoadedState({required this.season});
  @override
  List<Object> get props => [season];
}

final class EpisodeLoadedState extends SeasonAndEpisodeState {
  final Episode episode;

  EpisodeLoadedState({required this.episode});
  @override
  List<Object> get props => [episode];
}

final class ShowSeasonNumberState extends SeasonAndEpisodeState {}
