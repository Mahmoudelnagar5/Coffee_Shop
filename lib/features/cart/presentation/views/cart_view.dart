import 'package:caffeine_corner/features/cafe_home/presentation/widgets/price_and_card_section.dart';
import 'package:flutter/material.dart';

import '../../../cafe_home/data/models/coffee_model.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_cart_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomCartBar(),
          const Expanded(
            child: CartListView(),
          ),
          PriceAndCartSection(
            text: 'Checkout',
            coffee: CoffeeModel(
              name: 'test',
              price: 100,
              imageUrl: 'https://i.imgur.com/y6Fj8tu.jpg',
              description: 'test',
              ingredients: 'test',
              rating: 4.5,
              reviews: 'test',
            ),
          ),
        ],
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => const CartItem(),
    );
  }
}
