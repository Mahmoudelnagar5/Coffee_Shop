import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/coffee_model.dart';
import '../views/cafe_details_view.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;
  const CoffeeCard({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CafeDetailsView.routeName,
          arguments: coffee,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: Container(
          padding: const EdgeInsets.all(9),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff282C34),
                Color(0xff10131A),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: 130.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.network(
                          coffee.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15,
                        sigmaY: 20,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 50.w,
                        height: 25.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Apptheme.reviewIconColor,
                              size: 15,
                            ),
                            Text(
                              coffee.rating.toString(),
                              style: Apptheme.reviewRatting,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Text(coffee.name, style: Apptheme.cardTitleSmall),
              ),
              const SizedBox(height: 3),
              Text(coffee.ingredients, style: Apptheme.cardSubtitleSmall),
              const Spacer(),
              Row(
                children: [
                  Row(
                    children: [
                      Text('\$', style: Apptheme.priceCurrencySmall),
                      const SizedBox(width: 4),
                      Text(
                        coffee.price.toString(),
                        style: Apptheme.priceValueSmall,
                      ),
                    ],
                  ),
                  const Spacer(),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
