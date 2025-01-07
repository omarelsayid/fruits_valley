import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('المزيد',
              style: TextStyles.semiBold13.copyWith(color: Colors.grey[400])),
          Text('الاكثر مبيعاً',
              style: TextStyles.bold16.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
