import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_valley/core/utils/app_images.dart';
import 'package:fruits_valley/core/utils/app_text_styles.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/banners_item_buttons.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class BannersIetm extends StatelessWidget {
  const BannersIetm({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        width: itemWidth - 50,
        height: 158,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  right: itemWidth * 0.4,
                  child: SvgPicture.asset(Assets.imagesPageViewItem2Image)),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: itemWidth / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: svg.Svg(
                      Assets.imagesBannersItemBackground,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Opacity(
                          opacity: 0.80,
                          child: Text(
                            'عروض مميزة',
                            style: TextStyles.regular13.copyWith(
                              color: Colors.white,
                              height: 0.12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'خصم 25%',
                          style: TextStyles.bold19
                              .copyWith(color: Colors.white, height: 0),
                        ),
                        const SizedBox(height: 11),
                        const BannersItemButtons(),
                        const SizedBox(
                          height: 29,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
