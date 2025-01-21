// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fruits_valley/core/entity/prodcut_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;
  CartItemEntity({
    required this.productEntity,
    this.count = 0,
  });

  calculateTotalPrice() => productEntity.price * count;

  calucateTotalWeight() => productEntity.unitAmount * count;

  increaseCount() {
    count++;
  }

  decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
