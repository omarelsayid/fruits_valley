import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/best_selling_view_body.dart';

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
