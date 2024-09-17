import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';
import 'package:movies_app/tv_feature/domain/entities/season.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_episode_details_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';

part 'season_and_episode_event.dart';
part 'season_and_episode_state.dart';

class SeasonAndEpisodeBloc
    extends Bloc<SeasonAndEpisodeEvent, SeasonAndEpisodeState> {
  final GetEpisodeDetailsUsecase getEpisodeDetailsUsecase;
  final GetSeasonDetailsUsecase getSeasonDetailsUsecase;
  SeasonAndEpisodeBloc(
      {required this.getEpisodeDetailsUsecase,
      required this.getSeasonDetailsUsecase})
      : super(SeasonAndEpisodeInitial()) {
    on<GetSeasonEvent>((event, emit) async {
      final result = await getSeasonDetailsUsecase(event.parameter);
      result.fold((l) => emit(SeasonAndEpisodeErrorState(message: l.message)),
          (r) => emit(SeasonLoadedState(season: r)));
    });

    on<GetEpisodeEvent>(
      (event, emit) async {
        final result = await getEpisodeDetailsUsecase(event.parameter);
        result.fold((l) => emit(SeasonAndEpisodeErrorState(message: l.message)),
            (r) => emit(EpisodeLoadedState(episode: r)));
      },
    );
  }
}
