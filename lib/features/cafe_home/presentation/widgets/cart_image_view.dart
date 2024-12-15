import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/coffee_model.dart';
import 'blur_card_view.dart';

class CardImageView extends StatelessWidget {
  final CoffeeModel coffee;
  const CardImageView({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              coffee.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          left: 20.w,
          child: CustomButton(
            onTap: () {
              Navigator.pop(context);
            },
            width: 33.w,
            height: 33.h,
            borderRadius: 10,
            color: Apptheme.buttonBackground2Color,
            child: const Icon(
              CupertinoIcons.back,
              color: Apptheme.iconColor,
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.w,
          child: CustomButton(
            onTap: () {},
            width: 32.w,
            height: 33.h,
            borderRadius: 10,
            color: Apptheme.buttonBackground2Color,
            child: const Icon(
              Icons.favorite,
              color: Apptheme.iconColor,
            ),
          ),
        ),

        // BlurCardView
        BlurCardView(
          coffee: coffee,
        ),
      ],
    );
  }
}
