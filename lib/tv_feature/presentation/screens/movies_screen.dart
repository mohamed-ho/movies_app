import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/tv_feature/presentation/screens/more_movie_Screen.dart';
import 'package:movies_app/tv_feature/presentation/widgets/on_the_air_tv.dart';
import 'package:movies_app/tv_feature/presentation/widgets/populare_tv.dart';
import 'package:movies_app/tv_feature/presentation/widgets/top_rate_tv.dart';

class MainTvScreen extends StatefulWidget {
  const MainTvScreen({super.key});
  @override
  State<MainTvScreen> createState() => _MainTvScreen();
}

class _MainTvScreen extends State<MainTvScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OnTheAirTv(),
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
                              builder: (context) => MoreTvScreen(
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
          const PopulareTv(),
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
                              builder: (context) => MoreTvScreen(
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
          const TopRateTv(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
