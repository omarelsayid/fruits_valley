import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_valley/features/home/entity/bottom_navigation_bar_item_entity.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/navigation_bat_item.dart';

class CustomBottomNaigationBar extends StatefulWidget {
  const CustomBottomNaigationBar({super.key});

  @override
  State<CustomBottomNaigationBar> createState() =>
      _CustomBottomNaigationBarState();
}

class _CustomBottomNaigationBarState extends State<CustomBottomNaigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 70,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 20,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: BottomNavigationBarItemEntity.bottomNavigationBarItems
              .asMap()
              .entries
              .map(
            (e) {
              var index = e.key;
              var item = e.value;
              return Expanded(
                flex: index == selectedIndex ? 3 : 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      log('selected index : $selectedIndex');
                    });
                  },
                  child: NavigationBarItem(
                      isSelected: index == selectedIndex,
                      bottomNavigationBarItemEntity: item),
                ),
              );
            },
          ).toList(),
        ));
  }
}
