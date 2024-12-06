import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});

  final bool isChecked; // Specify bool type
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: GestureDetector(
        onTap: () {
          onChanged(!isChecked);
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutQuart,
          width: 24,
          height: 24,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isChecked ? AppColors.primayColor : Colors.white,
            border: Border.all(
                color: isChecked ? Colors.transparent : const Color(0xffDDDFDF),
                width: 1.5),
          ),
          child: isChecked
              ? Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(Assets.imagesCheck),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
