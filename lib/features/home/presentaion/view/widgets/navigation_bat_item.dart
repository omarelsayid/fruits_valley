import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../entity/bottom_navigation_bar_item_entity.dart';
import 'active_icon.dart';
import 'in_active_icon.dart';

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
