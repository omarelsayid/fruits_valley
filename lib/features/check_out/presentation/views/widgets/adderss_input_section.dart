import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/widgets/custom_text_form_filed.dart';

class AdderssInputSection extends StatelessWidget {
  const AdderssInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: 24.h,
          ),
          const CustomTextFormFiled(
              hintText: 'الاسم كامل', textInputType: TextInputType.text),
          const CustomTextFormFiled(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress),
          const CustomTextFormFiled(
              hintText: 'العنوان', textInputType: TextInputType.text),
          const CustomTextFormFiled(
              hintText: 'المدينه', textInputType: TextInputType.text),
          const CustomTextFormFiled(
              hintText: 'رقم الطابق , رقم الشقه ..',
              textInputType: TextInputType.text),
        ],
      ),
    );
  }
}

