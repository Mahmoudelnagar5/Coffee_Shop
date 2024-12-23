import 'package:caffeine_corner/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
            color: Apptheme.backgroundColor,
            onTap: () {},
            height: 40.h,
            width: 40.w,
            child: Image.asset(
              'assets/images/menu_icon.png',
            )),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            'https://i.imgur.com/uTjWuc8.jpg',
            fit: BoxFit.fill,
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}
