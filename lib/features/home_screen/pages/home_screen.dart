import 'package:flutter/material.dart';
import 'package:movies_project/features/home_screen/pages/popular_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularMovies()
      ],
    );
  }
}
