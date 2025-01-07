part of 'cart_item_cubit.dart';

abstract class CartItemState {
  const CartItemState();
}

class CartItemInitial extends CartItemState {}

class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUpdated({required this.cartItemEntity});
}
