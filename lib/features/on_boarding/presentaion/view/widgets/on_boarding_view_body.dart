import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../Authentication/presenttaion/views/singin_view.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'on_boarding_page_view.dart';

class OnBardingViewBody extends StatefulWidget {
  const OnBardingViewBody({
    super.key,
  });

  @override
  State<OnBardingViewBody> createState() => _OnBardingViewBodyState();
}

class _OnBardingViewBodyState extends State<OnBardingViewBody> {
  late PageController pageController;

  // we will use the currentpage in many condtion to handel the ui states
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            sizes: [
              const Size(13, 13),
              currentPage == 1
                  ? const Size(13, 13)
                  : const Size.square(9.0), // deafult size
            ],
            activeSizes: [
              const Size(13, 13),
              const Size(13, 13),
            ],
            color: currentPage == 1
                ? AppColors.primayColor
                : AppColors.primayColor.withOpacity(0.5), // Inactive color
            activeColor: AppColors.primayColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Visibility(
          maintainAnimation: true,
          maintainInteractivity: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage == 0 ? false : true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
                onpressed: () {
                  Prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.pushReplacementNamed(
                    context,
                    SignInView.routeName,
                  );
                },
                text: 'ابدأ الان'),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
