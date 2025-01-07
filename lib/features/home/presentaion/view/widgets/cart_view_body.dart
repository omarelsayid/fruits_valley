import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/helper_function/build_error_message.dart';
import 'package:fruits_valley/features/check_out/presentation/views/check_out_view.dart';
import 'cart_cutom_button.dart';
import '../../../../Authentication/presentation/views/widgets/build_app_bar.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'cart_header.dart';
import 'cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context,
                      title: 'السلة',
                      showBackIcon: false,
                      showNotification: false),
                  SizedBox(
                    height: 16.h,
                  ),
                  const CartHeader(),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.03.h,
            left: 16.w,
            right: 16.w,
            child: CartCustomButton(
              onPressed: () =>
                  context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                      ? Navigator.pushNamed(
                          context,
                          CheckOutView.routeName,
                          arguments: context.read<CartCubit>().cartEntity,
                        )
                      : buildErrorMessage(context, 'لا يوجد منتجات في السلة'),
            ))
      ],
    );
  }
}
