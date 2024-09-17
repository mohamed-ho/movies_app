import 'package:flutter/material.dart';
import 'package:movies_app/enjection_contener.dart';
import 'package:movies_app/movie_and_tv_app.dart';

void main() async {
  EnjectionContener().init();

  runApp(const MovieAndTvApp());
}
