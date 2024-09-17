import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_manegar.dart';
import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/tv_feature/domain/entities/episode.dart';
import 'package:movies_app/tv_feature/domain/entities/tv.dart';
import 'package:movies_app/tv_feature/domain/usecases/get_season_details_usecase.dart';
import 'package:movies_app/tv_feature/presentation/bloc/bloc/season_and_episode_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SeasonDropDownWidget extends StatefulWidget {
  SeasonDropDownWidget({super.key, required this.index, required this.tv});
  final int index;
  final Tv tv;

  @override
  State<SeasonDropDownWidget> createState() => _SeasonDropDownWidgetState();
}

bool isActive = false;

class _SeasonDropDownWidgetState extends State<SeasonDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isActive = !isActive;
        print(isActive);
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(48, 48, 60, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Season ${widget.index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
              visible: isActive,
              child: BlocBuilder<SeasonAndEpisodeBloc, SeasonAndEpisodeState>(
                bloc: ls<SeasonAndEpisodeBloc>()
                  ..add(GetSeasonEvent(
                      parameter: SeasonParameter(
                          tvId: widget.tv.id, seasonNumber: widget.index + 1))),
                builder: (context, state) {
                  if (state is SeasonAndEpisodeErrorState)
                    return Center(
                      child: Text('you have Error'),
                    );
                  else if (state is SeasonLoadedState) {
                    return SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: state.season.episodes.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TvEpisodeWidget(state.season.episodes[i]),
                            );
                          }),
                    );
                  } else
                    return SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                },
              ))
        ],
      ),
    );
  }
}

Widget TvEpisodeWidget(Episode spisode) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: CachedNetworkImage(
                  width: 150.0,
                  height: 80,
                  fit: BoxFit.cover,
                  imageUrl: ApiManegar.imageUrl(spisode.stillPath == null
                      ? '/4IZ7Hb8SPbHoCqL9iUWtlnusvLw.jpg'
                      : spisode.stillPath!),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 120.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${spisode.name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text('${spisode.airDate}',
                      style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            )
          ],
        ),
        Text(
          '${spisode.overview}',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    ),
  );
}
