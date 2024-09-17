import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/usecase.dart';

import 'package:movies_app/tv_feature/domain/usecases/get_on_the_air_tv_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_populare_tv_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_recommendation_tv_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_top_rate_tv_usecase.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_tv_details_usecase.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_event.dart';
import 'package:movies_app/tv_feature/presentation/bloc/tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvUsecase getOnTheAirTvUsecase;
  final GetPopulareTvUsecase getPopulareTvUsecase;
  final GetTopRateTvUsecase getTopRateTvUsecase;
  final GetTvDetailsUsecase getTvDetailsUsecase;
  final GetRecommendationTvUsecase getRecommendationTvUsecase;
  TvBloc(
      {required this.getOnTheAirTvUsecase,
      required this.getPopulareTvUsecase,
      required this.getTopRateTvUsecase,
      required this.getTvDetailsUsecase,
      required this.getRecommendationTvUsecase})
      : super(TvInitial()) {
    on<OnTheAirTvEvent>((event, emit) async {
      final result = await getOnTheAirTvUsecase(NoParam());
      result.fold((l) => emit(TvErrorState(message: l.message)),
          (r) => emit(TvLoadedState(tv: r)));
    });

    on<PopulareTvEvent>(
      (event, emit) async {
        final result = await getPopulareTvUsecase(NoParam());
        result.fold((l) => emit(TvErrorState(message: l.message)),
            (r) => emit(TvLoadedState(tv: r)));
      },
    );

    on<TopRateTvEvent>(
      (event, emit) async {
        final result = await getTopRateTvUsecase(NoParam());
        result.fold((l) => emit(TvErrorState(message: l.message)),
            (r) => emit(TvLoadedState(tv: r)));
      },
    );

    on<DetailsTvEvent>(
      (event, emit) async {
        final result = await getTvDetailsUsecase(event.id);
        result.fold((l) => emit(TvErrorState(message: l.message)),
            (r) => emit(TvDetailsLoadedState(tv: r)));
      },
    );
    on<RefreshEvent>(
      (event, emit) async {
        final result = await getTvDetailsUsecase(event.id);
        result.fold((l) => emit(TvErrorState(message: l.message)),
            (r) => emit(TvDetailsLoadedState(tv: r)));
      },
    );
    on<RecommendationTvEvent>(
      (event, emit) async {
        final result = await getRecommendationTvUsecase(event.id);
        result.fold((l) => emit(TvErrorState(message: l.message)),
            (r) => emit(TvRemommendationLoadedState(tv: r)));
      },
    );
  }
}
