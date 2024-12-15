import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../data/models/coffee_model.dart';
import 'categories_list_view.dart';
import 'coffee_card.dart';
import 'custom_app_bar.dart';
import 'search_widget.dart';

class CafeHomeView extends StatelessWidget {
  const CafeHomeView({super.key});
  static const String routeName = '/cafe-home';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 25),
          Text(
            'Find the best',
            style: Apptheme.titleLarge,
          ),
          Text(
            'coffee for you',
            style: Apptheme.titleLarge,
          ),
          const SizedBox(height: 20),
          const SearchWidget(),
          const SizedBox(height: 20),
          SizedBox(
            height: 40.h,
            child: const CategoriesListView(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: CoffeeModel.coffeeList.length, // Add itemCount
              itemBuilder: (context, index) => CoffeeCard(
                coffee: CoffeeModel.coffeeList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
