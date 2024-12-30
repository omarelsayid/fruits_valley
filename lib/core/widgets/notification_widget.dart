import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_valley/core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesNotif,
      height: 34,
      width: 34,
    );
  }
}
