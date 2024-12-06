import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Transform.flip(
          flipX: true,
          child: const Icon(Icons.arrow_back_ios),
        ),
      )
    ],
  );
}
