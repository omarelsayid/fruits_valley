import 'package:flutter/material.dart';

import '../../features/Authentication/presenttaion/views/sign_up_view.dart';
import '../../features/Authentication/presenttaion/views/singin_view.dart';
import '../../features/home/presentaion/view/home_view.dart';
import '../../features/on_boarding/presentaion/view/on_boarding_view.dart';
import '../../features/splash/presentaion/view/splash_view.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case SignInView.routeName:
        return MaterialPageRoute(builder: (_) => const SignInView());

      case SignUpView.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
