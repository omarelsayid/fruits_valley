import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/adderss_input_section.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/payment_section.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/shipping_section.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => getPages()[index],
        itemCount: getPages().length,
      ),
    );
  }

  List<Widget> getPages() => [
        const ShippingSection(),
        const AdderssInputSection(),
        const PaymentSection(),
      ];
}
