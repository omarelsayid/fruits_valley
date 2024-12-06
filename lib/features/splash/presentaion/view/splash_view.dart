import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, // transparent status bar
    // ));
    return const Scaffold(
      body: SafeArea(
        
        child: SpashViewBody()),
    );
  }
}
