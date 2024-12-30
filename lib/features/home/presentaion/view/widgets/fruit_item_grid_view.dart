import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/entity/prodcut_entity.dart';
import 'package:fruits_valley/core/widgets/fruit_ietm.dart';

class BestSellingGirdView extends StatelessWidget {
  const BestSellingGirdView({super.key, required this.products});
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163.w / 214.h,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return const FruitIetm();
      },
    );
  }
}
