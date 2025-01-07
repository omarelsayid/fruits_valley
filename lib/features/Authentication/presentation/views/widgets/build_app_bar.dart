import 'package:flutter/material.dart';
import '../../../../../core/widgets/notification_widget.dart';
import '../../../../../core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    required bool showBackIcon,
    bool showNotification = true}) {
  return AppBar(
    leadingWidth: 30,
    leading: Visibility(
        visible: showNotification, child: const NotificationWidget()),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    actions: [
      Visibility(
        visible: showBackIcon,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Transform.flip(
            flipX: true,
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      )
    ],
  );
}
