import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 376.w,
        height: 41.h,
        padding: EdgeInsets.symmetric(horizontal: 91.w, vertical: 10.h),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
        child: Center(
          child: Text(
            'لديك  ${context.watch<CartCubit>().cartEntity.cartItems.length}  منتجات في سله التسوق',
            style: TextStyles.regular13,
          ),
        ));
  }
}
