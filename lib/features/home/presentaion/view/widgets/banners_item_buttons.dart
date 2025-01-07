import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class BannersItemButtons extends StatelessWidget {
  const BannersItemButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          fixedSize: const Size(116, 32)),
      child: Text(
        "تسوق الان",
        style: TextStyles.bold13.copyWith(color: AppColors.primayColor),
      ),
    );
  }
}
