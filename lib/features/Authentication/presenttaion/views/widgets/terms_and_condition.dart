import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({
    super.key,
    required this.onAcceptChanged,
  });

  final ValueChanged<bool>
      onAcceptChanged; // Pass a callback instead of a direct variable

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool _acceptTermsAndCondition = false; // Local state

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Transform.translate(
            offset: const Offset(15, 0),
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: ' من خلال إنشاء حساب ، فإنك توافق على',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(
                    text: ' الشروط والأحكام الخاصة بنا ',
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimayColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        CustomCheckBox(
          isChecked: _acceptTermsAndCondition,
          onChanged: (value) {
            setState(() {
              _acceptTermsAndCondition = value;
              widget.onAcceptChanged(value); // Call the callback
            });
          },
        ),
      ],
    );
  }
}
