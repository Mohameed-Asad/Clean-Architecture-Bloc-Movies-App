import 'package:flutter/material.dart';
import 'package:movies_project/main.dart';

class Constants {

  static Size mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static const String apiKey = "50db3ec88a7d76b3238c56aa2115f181";
  static const String baseUrl = "api.themoviedb.org";
  static const String imagePath = "https://image.tmdb.org/t/p/w500";
}
