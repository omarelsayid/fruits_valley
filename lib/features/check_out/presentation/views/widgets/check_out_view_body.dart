import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/widgets/custom_button.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/check_out_steps_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});
  
  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CheckOutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
              child: CheckOutStepsPageView(pageController: pageController)),
          CustomButton(
              onpressed: () {
                pageController.animateToPage(currentPageIndex + 1,
                    duration: Durations.medium2, curve: Curves.fastOutSlowIn);
              },
              text: getNextButtonText(currentPageIndex)),
          SizedBox(
            height: 32.h,
          )
        ],
      ),
    );
  }

  String getNextButtonText(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return ' paypal الدفع عبر   ';
      default:
        return 'التالي';
    }
  }
}
