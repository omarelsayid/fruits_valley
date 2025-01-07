import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';


class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLlength});
  final int productsLlength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(
              alpha: 0.10000000149011612,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesFilter2,
          ),
        ),
        Text('$productsLlength نتائج     ',
            textDirection: TextDirection.rtl,
            style: TextStyles.bold16.copyWith(
              color: Colors.black,
            )),
      ],
    );
  }
}
