 import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

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

