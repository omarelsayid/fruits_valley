import '../entity/prodcut_entity.dart';
import '../entity/review_entity.dart';
import '../helper_function/get_avrage_rating.dart';
import 'review_model.dart';

class ProductModel {
  final String code;
  final String name;
  final String description;
  final num price;
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

  ProductModel({
    this.imageUrl,
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
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        imageUrl: json['imageUrl'],
        sellingCount: json['sellingCount'],
        reviews: (json['reviews'] as List<dynamic>)
            .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        expirationMonths: json['expirationMonths'],
        numberOfCalories: json['numberOfCalories'],
        isOrganic: json['isOrganic'],
        avgRating: getAvrageRating(json['reviews']),
        code: json['code'],
        isFeatured: json['isFeatured'],
        name: json['name'] ?? '',
        description: json['description'],
        price: json['price'] ?? 0.0,
      );
  ProductEntity toEntity() {
    return ProductEntity(
      // unitAmount: unitAmount,
      code: code,
      isFeatured: isFeatured,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      reviews: reviews
          .map<ReviewEntity>((e) => e.toEntity())
          .toList(), // Explicit type declaration
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
