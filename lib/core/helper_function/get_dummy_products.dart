import 'dart:io';

import 'package:fruits_valley/core/entity/prodcut_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    unitAmount: 1,
    code: '1234',
    isFeatured: true,
    name: 'apple',
    description: 'this is apple',
    price: 10,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzytXSqyKAp1BYS-WHSEPN7DARMMVYcmSO5g&s',
    expirationMonths: 12,
    numberOfCalories: 100,
    isOrganic: true,
    reviews: [],
    image: File(''),
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
