
import 'package:equatable/equatable.dart';
import 'review_entity.dart';

class ProductEntity extends Equatable {
  final String code;
  final String name;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount = 1;
  final bool isOrganic;
  final int ratingCount = 0;
  final num avgRating = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    this.imageUrl,
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfCalories,
    // required this.unitAmount,
    required this.isOrganic,
    required this.code,
    required this.isFeatured,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
