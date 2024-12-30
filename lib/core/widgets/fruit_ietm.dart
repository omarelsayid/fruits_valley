import 'package:flutter/material.dart';
import 'package:fruits_valley/core/utils/app_colors.dart';
import 'package:fruits_valley/core/utils/app_images.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitIetm extends StatelessWidget {
  const FruitIetm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(4),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(Assets.imagesWatermellonTest),
                SizedBox(
                  height: 24.h,
                ),
                ListTile(
                  title: Text(
                    'بطيخ',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.semiBold13.copyWith(color: Colors.black),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        size: 36.sp,
                        Icons.add_circle,
                        color: AppColors.primayColor,
                      ),
                      RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' جنيه 20',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '/ كيلو',
                              style: TextStyles.semiBold13.copyWith(
                                color: AppColors.lightSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
