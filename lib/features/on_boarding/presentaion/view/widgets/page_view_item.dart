import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../Authentication/presentation/views/singin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backGroudImage,
    required this.image,
    required this.tilte,
    required this.subTilte,
    required this.isVisible,
  });
  final bool isVisible;
  final String backGroudImage;
  final String image;
  final Widget tilte;
  final String subTilte;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
                width: MediaQuery.sizeOf(context).width, backGroudImage),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(image),
            ),
            Positioned(
              top: 39,
              left: 320,
              child: Visibility(
                visible: isVisible,
                child: InkWell(
                  onTap: () {
                    Prefs.setBool(kIsOnBoardingViewSeen, true);
                    Navigator.pushReplacementNamed(
                        context, SignInView.routeName);
                  },
                  child: const Text(
                    'تخط',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        tilte,
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 301,
          height: 66,
          child: Text(
            subTilte,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xff4E5556),
            ),
            textDirection: TextDirection.rtl, // Right-to-left text direction
          ),
        )
      ],
    );
  }
}


// first page tile


       
