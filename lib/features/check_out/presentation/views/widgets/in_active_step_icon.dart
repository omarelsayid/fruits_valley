import 'package:flutter/material.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';

class InActiveStepIcon extends StatelessWidget {
  const InActiveStepIcon({super.key, required this.text, required this.index});
  final String text;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            index,
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xFF0C0D0D)),
          ),
        ),
      ],
    );
  }
}
