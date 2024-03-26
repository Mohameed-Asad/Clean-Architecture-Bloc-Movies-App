import 'package:flutter/material.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/route_manager/routes.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      theme: AppThemeManager.applicationThemeData,
      initialRoute: PagesRoutesName.splash,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
