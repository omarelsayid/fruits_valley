import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_valley/core/utils/app_colors.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.image, required this.text});

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyles.semiBold11
                  .copyWith(color: AppColors.primayColor),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  color: AppColors.primayColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Center(child: SvgPicture.asset(image)),
            ),
          ],
        ),
      ),
    );
  }
}
