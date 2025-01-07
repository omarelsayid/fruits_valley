import 'package:flutter/material.dart';
import 'banners_ietm.dart';

class BannersListView extends StatelessWidget {
  const BannersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 32,
      height: 158,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const BannersIetm(),
      ),
    );
  }
}
