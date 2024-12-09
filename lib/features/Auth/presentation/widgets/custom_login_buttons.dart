import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_theme.dart';
import '../views/sign_up_view.dart';

class CustomLoginButtons extends StatelessWidget {
  const CustomLoginButtons({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Apptheme.cardSubtitleLarge.copyWith(
            color: Apptheme.backgroundColor,
            fontSize: 16.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            if (text2 == 'Sign up') {
              Navigator.pushNamed(context, SignUpView.routeName);
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            text2,
            style: GoogleFonts.amiri(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Apptheme.brownColor,
            ),
          ),
        ),
      ],
    );
  }
}
