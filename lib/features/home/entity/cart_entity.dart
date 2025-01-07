import '../../../core/entity/prodcut_entity.dart';
import 'cart_item_entity.dart';

class CartEntity  {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.productEntity.price * item.count;
    }
    return totalPrice;
  }

  bool isExist(ProductEntity productEntity) {
    for (var item in cartItems) {
      if (item.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var item in cartItems) {
      if (item.productEntity == productEntity) {
        return item;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }


}
