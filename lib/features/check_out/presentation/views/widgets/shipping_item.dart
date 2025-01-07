import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/utils/app_colors.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/active_shipping_item_dot.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/inactive_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.tilte,
      required this.subTilte,
      required this.price,
      required this.isSelected, required this.onTap});
  final String tilte, subTilte, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 343.w,
        height: 81.h,
        padding: EdgeInsets.only(
          top: 16.h,
          left: 13.w,
          right: 28.w,
          bottom: 16.h,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  // width: 1,
                  color: isSelected
                      ? AppColors.lightPrimayColor
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(4.r)),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              SizedBox(width: 10.h),
              Column(
                children: [
                  Text(
                    tilte,
                    style: TextStyles.semiBold13,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subTilte,
                    style: TextStyles.regular13
                        .copyWith(color: Colors.black.withValues(alpha: 0.5)),
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: TextStyles.bold13
                      .copyWith(color: AppColors.lightPrimayColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

