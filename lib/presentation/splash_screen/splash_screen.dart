import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_project/main.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/view_model/cubit.dart';

import '../../core/config/route_manager/routes_names.dart';
import '../../domain/entities/api_caller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PopularViewModel popVm = PopularViewModel();
  ReleaseViewModel relVm = ReleaseViewModel();
  RecommendedViewModel recVm = RecommendedViewModel();

  @override
  void initState() {
    popVm.getPopularMovies();
    relVm.getReleaseMovies();
    recVm.getRecommendedMovies();
    Timer(
      const Duration(seconds: 2),
      () {
        navigatorKey.currentState!.pushReplacementNamed(PagesRoutesName.layout,
            arguments: Apis(popVm: popVm, relVm: relVm, recVm: recVm));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.asset(
        "assets/Images/movies.png",
        alignment: Alignment.center,
      ),
    );
  }
}
