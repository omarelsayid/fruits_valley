import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        tilte: ':  ملخص الطلب',
        child: Column(
          children: [
            Row(
              children: [
                const Text('150جنية ', style: TextStyles.semiBold13),
                const Spacer(),
                Text(
                  ': المجموع الكلي ',
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0XFF4E5556),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                const Text('30جنية ', style: TextStyles.semiBold13),
                const Spacer(),
                Text(
                  ': التوصيل',
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0XFF4E5556),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            const Divider(
              color: Color(0xFFCACECE),
              thickness: 0.5,
            ),
            SizedBox(
              height: 9.h,
            ),
            const Row(
              children: [
                Text('150جنية ', style: TextStyles.semiBold13),
                Spacer(),
                Text(': المجموع الكلي ', style: TextStyles.bold13)
              ],
            ),
            const PaymentItem(tilte: 'عنوان التوصيل', child: Row(
              children: [
                
              ],
            ))
          ],
        ));
  }
}
