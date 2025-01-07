import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../entity/prodcut_entity.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentaion/cubits/cart_cubit/cart_cubit.dart';

class FruitIetm extends StatelessWidget {
  const FruitIetm({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5F7),
        borderRadius: BorderRadius.circular(4.r),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Flexible(child: Image.network(productEntity.imageUrl!)),
                SizedBox(
                  height: 24.h,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textDirection: TextDirection.rtl,
                    style: TextStyles.semiBold13.copyWith(color: Colors.black),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartCubit>()
                              .addCartProduct(productEntity);
                        },
                        child: Icon(
                          size: 36.sp,
                          Icons.add_circle,
                          color: AppColors.primayColor,
                        ),
                      ),
                      RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' ${productEntity.price.toString()} جنية',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '/ كيلو',
                              style: TextStyles.semiBold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
