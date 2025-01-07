import 'package:flutter/material.dart';
import 'package:fruits_valley/features/check_out/presentation/views/check_out_view.dart';
import 'package:fruits_valley/features/home/entity/cart_entity.dart';
import 'package:fruits_valley/features/home/entity/cart_item_entity.dart';
import '../../features/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../features/Authentication/presentation/views/sign_up_view.dart';
import '../../features/Authentication/presentation/views/singin_view.dart';
import '../../features/home/presentaion/view/main_view.dart';
import '../../features/on_boarding/presentaion/view/on_boarding_view.dart';
import '../../features/splash/presentaion/view/splash_view.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case CheckOutView.routeName:
        return MaterialPageRoute(
            builder: (_) => CheckOutView(
                  cartItems: settings.arguments as CartEntity,
                ));
      case BestSellingView.routeName:
        return MaterialPageRoute(builder: (_) => const BestSellingView());
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case SignInView.routeName:
        return MaterialPageRoute(builder: (_) => const SignInView());

      case SignUpView.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case MainView.routeName:
        return MaterialPageRoute(builder: (_) => const MainView());

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
