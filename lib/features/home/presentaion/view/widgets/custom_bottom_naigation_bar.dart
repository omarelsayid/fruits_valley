
import 'package:flutter/material.dart';
import '../../../entity/bottom_navigation_bar_item_entity.dart';
import 'navigation_bat_item.dart';

class CustomBottomNaigationBar extends StatefulWidget {
  const CustomBottomNaigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
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
                      widget.onItemTapped(index);
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
