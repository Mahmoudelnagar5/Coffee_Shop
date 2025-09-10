import 'package:caffeine_corner/features/cafe_home/presentation/widgets/price_and_card_section.dart';
import 'package:flutter/material.dart';

import '../../../cafe_home/data/models/coffee_model.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_cart_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final CoffeeModel coffee =
        ModalRoute.of(context)!.settings.arguments as CoffeeModel;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomCartBar(),
          Expanded(
            child: CartListView(coffee: coffee),
          ),
          PriceAndCartSection(
            text: 'Checkout',
            coffee: coffee,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.coffee,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => CartItem(coffee: coffee),
    );
  }
}
