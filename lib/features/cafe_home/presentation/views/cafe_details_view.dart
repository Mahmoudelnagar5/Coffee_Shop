import 'package:flutter/material.dart';
import '../../../../core/utils/app_theme.dart';
import '../../data/models/coffee_model.dart';
import '../widgets/cart_image_view.dart';
import '../widgets/description_view.dart';
import '../widgets/price_and_card_section.dart';
import '../widgets/size_choice_view.dart';

class CafeDetailsView extends StatelessWidget {
  static const String routeName = '/cafe-details';
  const CafeDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CoffeeModel coffee =
        ModalRoute.of(context)!.settings.arguments as CoffeeModel;

    return Scaffold(
      backgroundColor: Apptheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Section -> Card Image
            Expanded(
              child: CardImageView(coffee: coffee),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section -> Description
                      DescriptionView(description: coffee.description),
                      const SizedBox(height: 30),
                      // Section -> Size Choice
                      const SizeChoiceView(),
                      const SizedBox(height: 30),
                      // Section -> Price and Add to Cart
                      PriceAndCartSection(coffee: coffee),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
