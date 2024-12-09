import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_theme.dart';

class CustomLoginButtons extends StatelessWidget {
  const CustomLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Apptheme.cardSubtitleLarge.copyWith(
            color: Apptheme.backgroundColor,
            fontSize: 16.sp,
          ),
        ),
        TextButton(
          onPressed: null,
          child: Text(
            'Register',
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
