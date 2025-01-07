import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/entity/prodcut_entity.dart';
import '../../../../../core/widgets/fruit_ietm.dart';

class ProductsGirdView extends StatelessWidget {
  const ProductsGirdView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163.w / 214.h,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 16.w,
      ),
      itemBuilder: (context, index) {
        return FruitIetm(
          productEntity: products[index],
        );
      },
    );
  }
}
