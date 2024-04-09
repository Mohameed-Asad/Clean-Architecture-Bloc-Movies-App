import 'package:flutter/material.dart';
import 'package:movies_project/core/config/route_manager/routes_names.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/entities/category_model.dart';

import '../../../presentation/browse_screen/pages/category_movies/category_movies_screen.dart';
import '../../../presentation/layout_view.dart';
import '../../../presentation/movies_details_screen/pages/movies_details_screen.dart';
import '../../../presentation/splash_screen/splash_screen.dart';

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
            builder: (context) =>
                MoviesDetails(model: settings.arguments as AllMoviesModel),
            settings: settings);
      case PagesRoutesName.categoryList:
        return MaterialPageRoute(
            builder: (context) => CategoryListScreen(
                categoryModel: settings.arguments as CategoryModel),
            settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
