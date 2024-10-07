import 'package:flutter/material.dart';
import 'package:fruits_valley/features/home/presentaion/view/home_view.dart';
import 'package:fruits_valley/features/splash/presentaion/view/splash_view.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
