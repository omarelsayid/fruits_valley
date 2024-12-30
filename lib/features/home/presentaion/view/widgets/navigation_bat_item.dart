import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_valley/features/home/entity/bottom_navigation_bar_item_entity.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/active_icon.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/in_active_icon.dart';

class NavigationBarItem extends StatelessWidget {
  NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarItemEntity});
  bool isSelected;
  final BottomNavigationBarItemEntity bottomNavigationBarItemEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            image: bottomNavigationBarItemEntity.activeImage,
            text: bottomNavigationBarItemEntity.name,
          ).animate().addEffect(const MoveEffect(
              curve: Curves.fastOutSlowIn,
            ))
        : InActiveIcon(image: bottomNavigationBarItemEntity.inActiveImage);
  }
}
