import 'package:flutter/material.dart';

import '../../data/models/coffee_model.dart';
import 'category_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: CoffeeModel.categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index; // Update selected index
            });
          },
          child: CategoeryItem(
            coffe: CoffeeModel.categories[index],
            isActive: index == selectedIndex, // Check if the item is selected
          ),
        );
      },
    );
  }
}
