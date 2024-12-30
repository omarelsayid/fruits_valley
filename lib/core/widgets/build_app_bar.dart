 import 'package:flutter/material.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/core/widgets/notification_widget.dart';

AppBar BuildAppBar() {
    return AppBar(
      actions: const [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NotificationWidget())
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Center(
        child: Text(
          'الاكثر مبيعاً',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyles.bold19,
        ),
      ),
    );
  }

