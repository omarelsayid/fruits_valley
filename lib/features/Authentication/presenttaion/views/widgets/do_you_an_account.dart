import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../singin_view.dart';

class DoYouHaveAnAccount extends StatelessWidget {
  const DoYouHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignInView.routeName);
              },
            text: 'تسجيل دخول',
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.primayColor,
            ),
          ),
        ],
      ),
    );
  }
}
