import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_theme.dart';
import '../../data/models/intro_model.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.controller,
    required this.introductionItems,
  });

  final PageController controller;
  final List<IntroModel> introductionItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.65.h),
      child: SmoothPageIndicator(
        controller: controller,
        count: introductionItems.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Apptheme.indicatorActiveColor,
          dotColor: Apptheme.indicatorInactiveColor,
          dotHeight: 5.h,
          dotWidth: 10.w,
        ),
      ),
    );
  }
}
