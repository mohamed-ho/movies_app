import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/movie_feature/presentation/screens/movies_screen.dart';
import 'package:movies_app/tv_feature/presentation/screens/movies_screen.dart';

class MovieAndTvApp extends StatefulWidget {
  const MovieAndTvApp({super.key});

  @override
  State<MovieAndTvApp> createState() => _MovieAndTvAppState();
}

int index = 0;

class _MovieAndTvAppState extends State<MovieAndTvApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: AnimatedNotchBottomBar(
            notchBottomBarController: NotchBottomBarController(index: index),
            onTap: (value) {
              index = value;

              setState(() {});
            },
            color: Colors.black54,
            notchColor: Colors.red,
            kIconSize: 30,
            kBottomRadius: 20,
            bottomBarItems: const [
              BottomBarItem(
                  inActiveItem: Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.grey,
                    size: 22,
                  ),
                  activeItem: Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.white,
                    size: 28,
                  )),
              BottomBarItem(
                  inActiveItem: Icon(
                    Icons.tv_outlined,
                    color: Colors.grey,
                    size: 22,
                  ),
                  activeItem: Icon(
                    Icons.tv_outlined,
                    color: Colors.white,
                    size: 28,
                  ))
            ],
          ),
          backgroundColor: Colors.black,
          body: index == 0 ? const MainMoviesScreen() : const MainTvScreen(),
        ));
  }
}
