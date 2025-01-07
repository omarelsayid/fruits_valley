import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_valley/core/utils/app_colors.dart';
import 'package:fruits_valley/core/utils/app_images.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';

class ActiveStepIcon extends StatelessWidget {
  const ActiveStepIcon({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
         text,
          style: TextStyles.semiBold13.copyWith(color: AppColors.primayColor),
        ),
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primayColor,
          child: SvgPicture.asset(Assets.imagesCheck),
        ),
      ],
    );
  }
}
