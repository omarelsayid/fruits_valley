import 'package:bloc/bloc.dart';
import '../../../../../core/entity/prodcut_entity.dart';
import '../../../entity/cart_entity.dart';
import '../../../entity/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity([]);
  void addCartProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);

    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void delteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.deleteCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
