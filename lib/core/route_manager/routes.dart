import 'package:flutter/material.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/features/layout_view.dart';
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

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
