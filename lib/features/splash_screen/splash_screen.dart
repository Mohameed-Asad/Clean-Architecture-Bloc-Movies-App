import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(
      const Duration(seconds: 1),
      () {
        navigatorKey.currentState!.pushReplacementNamed(PagesRoutesName.layout);
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
