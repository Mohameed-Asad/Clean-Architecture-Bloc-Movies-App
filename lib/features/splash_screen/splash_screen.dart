import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_project/core/models/api_models.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var popApi = ApiManager.getPopularMovies();
    var relApi = ApiManager.getReleaseMovies();
    var recoApi = ApiManager.getRecommendedMovies();
    Timer(
      const Duration(seconds: 2),
      () {
        navigatorKey.currentState!.pushReplacementNamed(PagesRoutesName.layout,
            arguments: ApisCaller(
                popularApi: popApi,
                releaseApi: relApi,
                recommendedApi: recoApi));
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
