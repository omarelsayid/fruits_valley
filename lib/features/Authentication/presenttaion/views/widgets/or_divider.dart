import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xffDDDFDF),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Text(
            'أو',
            style: TextStyles.semiBold16,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xffDDDFDF),
          ),
        ),
      ],
    );
  }
}
