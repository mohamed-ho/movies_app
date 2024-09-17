import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movie_feature/presentation/screens/more_movie_Screen.dart';
import 'package:movies_app/movie_feature/presentation/widgets/now_playing_movies_widget.dart';
import 'package:movies_app/movie_feature/presentation/widgets/populare_movies_widget.dart';
import 'package:movies_app/movie_feature/presentation/widgets/top_rate_widget.dart';

class MainMoviesScreen extends StatefulWidget {
  const MainMoviesScreen({super.key});

  @override
  State<MainMoviesScreen> createState() => _MainMoviesScreenState();
}

class _MainMoviesScreenState extends State<MainMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NowPlayingMoviesWidget(),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white),
                ),
                Builder(
                  builder: (context) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreMovieScreen(
                                  type: AppStrings.populareScreenType)));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const PopulareMoviesWidget(),
          Container(
            margin: const EdgeInsets.fromLTRB(
              16.0,
              24.0,
              16.0,
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Rated",
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white),
                ),
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreMovieScreen(
                                    type: AppStrings.topRateScreenType,
                                  )));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const TopRateWidget(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
