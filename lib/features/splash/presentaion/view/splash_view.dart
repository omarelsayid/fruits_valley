import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return const Scaffold(
      body: SpashViewBody(),
    );
  }
}
