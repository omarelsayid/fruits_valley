import 'package:flutter/material.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/core/widgets/build_app_bar.dart';
import 'package:fruits_valley/core/widgets/notification_widget.dart';
import 'package:fruits_valley/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: const BestSellingViewBody(),
    );
  }
}
