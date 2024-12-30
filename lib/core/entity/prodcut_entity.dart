import 'dart:io';

import 'package:fruits_valley/core/entity/review_entity.dart';


class ProductEntity {
  final String code;
  final String name;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final bool isOrganic;
  final int ratingCount = 0;
  final num avgRating = 0;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {this.imageUrl,
      required this.reviews,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.isOrganic,
      required this.code,
      required this.isFeatured,
      required this.name,
      required this.description,
      required this.price,
      required this.image});
}
