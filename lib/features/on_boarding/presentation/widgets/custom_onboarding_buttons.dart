import 'package:caffeine_corner/features/Auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/intro_model.dart';

class CustomOnBoardingButtons extends StatelessWidget {
  const CustomOnBoardingButtons({
    super.key,
    required this.controller,
    required this.introductionItems,
    required this.currentPage,
  });

  final PageController controller;
  final List<IntroModel> introductionItems;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(introductionItems.length - 1);
              },
              child: Text(
                'Skip',
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          currentPage != introductionItems.length - 1
              ? CircleAvatar(
                  backgroundColor: Apptheme.indicatorActiveColor,
                  radius: 20.r,
                  child: IconButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                )
              : CustomButton(
                  width: 110.w,
                  height: 50.h,
                  color: Apptheme.buttonBackground2Color,
                  borderRadius: 16,
                  onTap: () {
                    Navigator.pushNamed(context, SignInView.routeName);
                  },
                  child: Text(
                    'Get Started',
                    style: Apptheme.cardTitleSmall,
                  ),
                ),
        ],
      ),
    );
  }
}
