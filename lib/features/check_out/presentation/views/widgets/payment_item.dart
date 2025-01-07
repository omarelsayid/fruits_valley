import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/services/app_decorations.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.tilte, required this.child});
  final String tilte;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 24),
        const Text(
          'ملخص الطلب',
          style: TextStyles.semiBold13,
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        )
      ],
    );
  }
}
