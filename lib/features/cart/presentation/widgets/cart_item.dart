import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../cafe_home/data/models/coffee_model.dart';
import 'card_item.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.coffee,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff262B33),
            Colors.grey.shade800,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CardItem(coffee: coffee),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Capuchino',
                    style: Apptheme.cardTitleLarge,
                  ),
                  Text(
                    'Espresso, milk, sugar',
                    style: Apptheme.cardSubtitleLarge,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        onTap: null,
                        width: 55.w,
                        height: 36.h,
                        color: Apptheme.buttonBackground2Color,
                        child: Text(
                          'M',
                          style: Apptheme.buttonActiveTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$ ',
                              style: Apptheme.priceCurrencyLarge,
                            ),
                            TextSpan(
                              text: '1.99',
                              style: Apptheme.priceValueLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h), // Add spacing to avoid Spacer
                  Row(
                    children: [
                      CustomButton(
                        onTap: () {},
                        height: 30.h,
                        width: 31.w,
                        color: Apptheme.buttonBackground1Color,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      CustomButton(
                        onTap: null,
                        width: 60.w,
                        height: 36.h,
                        color: Apptheme.buttonBackground2Color,
                        borderColor: Apptheme.buttonBorderColor,
                        child: Text(
                          '1',
                          style: Apptheme.buttonActiveTextStyle,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      CustomButton(
                        onTap: () {},
                        height: 30.h,
                        width: 31.w,
                        color: Apptheme.buttonBackground1Color,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
