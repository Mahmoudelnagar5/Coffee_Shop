import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/coffee_model.dart';
import '../../data/repo/checkout_repo_impl.dart';
import '../manager/payment_cubit.dart';
import 'payment_method_bottom_sheet.dart';

class PriceAndCartSection extends StatelessWidget {
  const PriceAndCartSection({
    super.key,
    required this.coffee,
    required this.text,
  });

  final CoffeeModel coffee;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: Apptheme.priceTitleLarge,
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$ ',
                      style: Apptheme.priceCurrencyLarge,
                    ),
                    TextSpan(
                      text: coffee.price.toString(),
                      style: Apptheme.priceValueLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Apptheme.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
            width: 170.w,
            height: 50.h,
            borderRadius: 16,
            color: Apptheme.buttonBackground1Color,
            child: Text(text, style: Apptheme.buttonTextStyle),
          ),
        ],
      ),
    );
  }
}
