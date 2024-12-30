import 'package:flutter/material.dart';
import 'package:fruits_valley/core/helper_function/get_user.dart';
import 'package:fruits_valley/core/utils/app_images.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.imagesProfileImage,
        height: 44,
        width: 44,
      ),
      title: Text(
        'صباح الخير',
        style: TextStyles.regular16.copyWith(color: Colors.grey[400]),
      ),
      subtitle: Text(getUser().name, style: TextStyles.bold16),
      trailing: const NotificationWidget(),
    );
  }
}
