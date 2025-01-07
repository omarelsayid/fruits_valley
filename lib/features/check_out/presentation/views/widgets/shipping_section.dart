import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/features/check_out/domain/entities/order_entity.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 33.h,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          price:
              context.read<OrderEntity>().cartEntity.getTotalPrice().toString(),
          subTilte: 'الدفع عند التسليم',
          tilte: "التسليم من المكان",
        ),
        SizedBox(height: 10.h),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          price:
              context.read<OrderEntity>().cartEntity.getTotalPrice().toString(),
          subTilte: 'الدفع اون لاين',
          tilte: "يرجي تحديد طريقه الدفع",
        )
      ],
    );
  }
}
