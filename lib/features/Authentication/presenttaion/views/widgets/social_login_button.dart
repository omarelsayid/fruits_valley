import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.image,
    required this.tilte,
    required this.onPressed,
  });
  final String image;
  final String tilte;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
            // fixedSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xffDDDFDF),
                ))),
        onPressed: onPressed,
        child: Center(
          child: ListTile(
            visualDensity:
                const VisualDensity(vertical: VisualDensity.minimumDensity),
            trailing: SvgPicture.asset(image),
            title: Text(
              textAlign: TextAlign.center,
              tilte,
              style: TextStyles.semiBold16,
            ),
          ),
        ),
      ),
    );
  }
}
