import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../entity/cart_item_entity.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .delteCartItem(cartItemEntity);
                            },
                            child: SvgPicture.asset(Assets.imagesTrash)),
                        const Spacer(),
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        )
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calucateTotalWeight()} كم',
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${cartItemEntity.productEntity.price} جنية',
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        const Spacer(),
                        CartItemActionButtons(
                          cartItemEntity: cartItemEntity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 17.w,
              ),
              Container(
                width: 73.w,
                height: 92.h,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: Image.network(
                  cartItemEntity.productEntity.imageUrl!,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
