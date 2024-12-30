import 'dart:io';

import 'package:fruits_valley/core/entity/prodcut_entity.dart';
import 'package:fruits_valley/core/entity/review_entity.dart';
import 'package:fruits_valley/core/models/review_model.dart';

class ProductModel {
  final String code;
  final String name;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount = 0;
  final int sellingCount;
  final bool isOrganic;
  final int ratingCount = 0;
  final num avgRating;
  final List<ReviewModel> reviews;

  ProductModel(
      {this.imageUrl,
      required this.sellingCount,
      required this.reviews,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.isOrganic,
      required this.avgRating,
      required this.code,
      required this.isFeatured,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      sellingCount: json['sellingCount'],
      reviews: json['reviews'].map((e) => ReviewModel.fromJson(e)).toList(),
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      isOrganic: json['isOrganic'],
      avgRating: json['avgRating'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image']);
  ProductEntity toEnity() {
    return ProductEntity(
      unitAmount: unitAmount,
      image: image,
      code: code,
      isFeatured: isFeatured,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList() as List<ReviewEntity>,
    );
  }

  toJson() {
    return {
      'code': code,
      'isFeatured': isFeatured,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
