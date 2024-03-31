import 'package:flutter/material.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/features/browse_screen/pages/categorylist_screen.dart';
import 'package:movies_project/features/layout_view.dart';
import 'package:movies_project/features/movies_details_screen/pages/movies_details_screen.dart';
import 'package:movies_project/features/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case PagesRoutesName.layout:
        return MaterialPageRoute(
            builder: (context) => const LayoutView(), settings: settings);
      case PagesRoutesName.details:
        return MaterialPageRoute(
            builder: (context) => const MoviesDetails(), settings: settings);
      case PagesRoutesName.categoryList:
        return MaterialPageRoute(
            builder: (context) => const CategoryListScreen(),
            settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
