import '../entity/prodcut_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    // unitAmount: 1,
    code: '1234',
    isFeatured: true,
    name: 'apple',
    description: 'this is apple',
    price: 10,
    imageUrl:
        'https://png.pngitem.com/pimgs/s/111-1112851_don-t-throw-fruit-fruit-png-transparent-png.png',
    expirationMonths: 12,
    numberOfCalories: 100,
    isOrganic: true,
    reviews: const [],
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
