import '../../../core/utils/app_images.dart';

class BottomNavigationBarItemEntity {
  final String activeImage;
  final String inActiveImage;
  final String name;

  BottomNavigationBarItemEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});

  static List<BottomNavigationBarItemEntity> get bottomNavigationBarItems => [
        BottomNavigationBarItemEntity(
            activeImage: Assets.imagesBoldHomeActtive,
            inActiveImage: Assets.imagesOutlinedVector,
            name: 'الرئيسية'),
        BottomNavigationBarItemEntity(
            activeImage: Assets.imagesBoldElement3,
            inActiveImage: Assets.imagesOutlinedElement3,
            name: 'سلة التشوق'),
        BottomNavigationBarItemEntity(
            activeImage: Assets.imagesBoldShoppingCart,
            inActiveImage: Assets.imagesOutlinedShoppingCart,
            name: 'المنتجات'),
        BottomNavigationBarItemEntity(
            activeImage: Assets.imagesBoldUser,
            inActiveImage: Assets.imagesOutlinedUser,
            name: 'حسابي'),
      ];
}
