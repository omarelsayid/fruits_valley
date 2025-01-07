import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kTopPadding),
      child: Container(
        width: 343.w,
        height: 40.h,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              iconSize: 20,
              icon: SvgPicture.asset(
                Assets.imagesSearch,
              ),
              onPressed: () {},
            ),
            prefixIcon: IconButton(
              iconSize: 20.w,
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.imagesSetting4,
              ),
            ),
            hintText: '.... ابحث عن',
            hintStyle: TextStyles.regular13.copyWith(
              color: const Color(0xff949D9E),
            ),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
