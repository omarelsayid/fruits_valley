import 'package:flutter/material.dart';
import 'package:fruits_valley/features/Authentication/presentation/views/widgets/build_app_bar.dart';
import 'package:fruits_valley/features/check_out/domain/entities/order_entity.dart';
import 'package:fruits_valley/features/check_out/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruits_valley/features/home/entity/cart_entity.dart';
import 'package:fruits_valley/features/home/entity/cart_item_entity.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartItems});
  final CartEntity cartItems;
  static const String routeName = 'CheckOutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'الشحن', showBackIcon: true, showNotification: false),
      body: Provider.value(
          value: OrderEntity(
            cartEntity: cartItems,
          ),
          child: CheckOutViewBody()),
    );
  }
}
