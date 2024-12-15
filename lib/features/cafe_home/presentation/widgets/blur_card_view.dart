import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../data/models/coffee_model.dart';

class BlurCardView extends StatelessWidget {
  final CoffeeModel coffee;
  const BlurCardView({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 2,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 140.h,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.name,
                          style: Apptheme.cardTitleLarge,
                        ),
                        Text(
                          coffee.ingredients,
                          style: Apptheme.cardSubtitleLarge,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 57.w,
                      height: 57.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Apptheme.cardChipBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // SvgPicture.asset(
                            //   'assets/icons/coffe.svg',
                            //   height: 25,
                            // ),
                            Text(
                              'Coffee',
                              style: Apptheme.cardChipTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 57.w,
                      height: 57.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Apptheme.cardChipBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // SvgPicture.asset('assets/icons/milk.svg'),
                            Text(
                              'Milk',
                              style: Apptheme.cardChipTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Apptheme.reviewIconColor,
                      size: 20,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      coffee.rating.toString(),
                      style: Apptheme.cardTitleSmall,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(${coffee.reviews})',
                      style: Apptheme.cardSubtitleSmall,
                    ),
                    const Spacer(),
                    Container(
                      width: 110.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Apptheme.cardChipBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Medium Roasted',
                              style: Apptheme.cardChipTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
