import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          backGroudImage: Assets.imagesPageViewItem1BackgroundImage,
          image: Assets.imagesFruitBasketAmico1,
          isVisible: true,
          tilte: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Fruit',
              style: TextStyles.bold23.copyWith(
                color: AppColors.primayColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Hub',
                  style: TextStyles.bold23
                      .copyWith(color: AppColors.secondaryColor),
                ),
                TextSpan(
                  text: '  مرحبًا بك في',
                  style: TextStyles.bold23.copyWith(
                    color: const Color(0xff0C0D0D),
                  ),
                ),
              ],
            ),
          ),
          subTilte:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        const PageViewItem(
            backGroudImage: Assets.imagesPageViewItem2BackgroundImage,
            image: Assets.imagesPageViewItem2Image,
            tilte: Text(
              'ابحث وتسوق',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff0C0D0D)),
            ),
            subTilte:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            isVisible: false)
      ],
    );
  }
}
