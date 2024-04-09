import 'package:flutter/material.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/popular_movies.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/recommended_movies.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/release_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // here show CarouselSlider for popular Movies
        PopularMovies(),
        SizedBox(
          height: 5,
        ),
        // here show the listview of release Movies
        ReleaseMovies(),
        SizedBox(
          height: 20,
        ),
        // here show the listview of recommended Movies
        RecommendedMovies()
      ],
    );
  }
}
