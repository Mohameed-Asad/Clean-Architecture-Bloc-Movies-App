import 'package:flutter/material.dart';
import 'package:movies_project/main.dart';

class Constants {
  static Size mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static const String apiKey = "50db3ec88a7d76b3238c56aa2115f181";
  static const String token =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w";
  static const String baseUrl = "https://api.themoviedb.org";
  static const String imagePath = "https://image.tmdb.org/t/p/w500";
}
