import 'package:flutter/material.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/active_step_icon.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/in_active_step_icon.dart';

class SetpItem extends StatelessWidget {
  const SetpItem({
    super.key,
    required this.index,
    required this.text,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveStepIcon(text: text, index: index),
        secondChild: ActiveStepIcon(text: text),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 500));
  }
}
