import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'widgets/cart_view_body.dart';

class CartVew extends StatelessWidget {
  const CartVew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartViewBody(),
    );
  }
}
