import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../Authentication/presenttaion/views/singin_view.dart';
import '../../../../on_boarding/presentaion/view/on_boarding_view.dart';

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
    navigationExcute();

    super.initState();
  }

  void navigationExcute() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
        if (isOnBoardingViewSeen) {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
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
