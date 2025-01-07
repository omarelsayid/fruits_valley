import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper_function/build_error_message.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            buildErrorMessage(context, 'تم اضافة المنتج بنجاح');
          }
          if (state is CartItemRemoved) {
            buildErrorMessage(context, 'تم اضافة المنتج بنجاح');
          }
        },
        child: MainViewBody(currentIndex: currentIndex));
  }
}
