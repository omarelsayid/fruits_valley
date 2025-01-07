import 'package:flutter/material.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/setp_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final PageController pageController;
  final currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          3,
          (index) => Expanded(
                  child: GestureDetector(
                onTap: () {
                  pageController.animateToPage(index,
                      duration: Durations.medium2, curve: Curves.fastOutSlowIn);
                },
                child: SetpItem(
                  isActive: index <= currentPageIndex,
                  text: getSteps()[index],
                  index: (index + 1).toString(),
                ),
              ))),
    );
  }
}

List<String> getSteps() => [
      'الشحن',
      'العنوان',
      'الدفع',
    ];
