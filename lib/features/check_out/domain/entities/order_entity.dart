// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fruits_valley/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_valley/features/home/entity/cart_entity.dart';
import 'package:fruits_valley/features/home/entity/cart_item_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final ShippingAddressEntity? shippingAddressEntity;
  const OrderEntity({
    this.shippingAddressEntity,
    required this.cartEntity,
    this.payWithCash,
  });
  final bool? payWithCash;
}
