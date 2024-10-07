import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_valley/core/utils/app_images.dart';
import 'package:fruits_valley/features/home/presentaion/view/home_view.dart';

class SpashViewBody extends StatefulWidget {
  const SpashViewBody({
    super.key,
  });

  @override
  State<SpashViewBody> createState() => _SpashViewBodyState();
}

class _SpashViewBodyState extends State<SpashViewBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(Assets.imagesPlants),
        ),
        SvgPicture.asset(Assets.imagesFruitsHub).animate().fadeIn().scale(),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
