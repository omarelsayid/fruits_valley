import 'package:flutter/material.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/custom_bottom_naigation_bar.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeView(),
      
      ),
    bottomNavigationBar: CustomBottomNaigationBar(),
    );
  }
}
