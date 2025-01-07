import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../entity/cart_item_entity.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CartItemActionButton(
          onPressed: () {
            cartItemEntity.decreaseCount();

            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          color: const Color(0xffF9FAFA),
          icon: Icons.remove,
          iconColor: Colors.grey,
        ),
        Text(cartItemEntity.count.toString(), style: TextStyles.bold16),
        CartItemActionButton(
          onPressed: () {
            cartItemEntity.increaseCount();

            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          color: AppColors.primayColor,
          icon: Icons.add,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onPressed,
      required this.iconColor});
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            // size: 20,
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
