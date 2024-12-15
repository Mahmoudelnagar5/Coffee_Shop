import 'package:caffeine_corner/features/cafe_home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/utils/app_theme.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/coffee_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_widget.dart';

class CafeHomeView extends StatelessWidget {
  const CafeHomeView({super.key});
  static const String routeName = '/cafe-home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Apptheme.backgroundColor,
        body: Padding(
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
        ),
        bottomNavigationBar: const CustomNavBar(),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedColor = Apptheme.iconActiveColor;
    const unSelectedColor = Apptheme.iconColor;
    const currentIndex = 0;

    return SizedBox(
      height: 60.h,
      child: StylishBottomBar(
        backgroundColor: const Color(0xff0D1015),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            selectedIcon: const Icon(Icons.home),
            selectedColor: selectedColor,
            unSelectedColor: unSelectedColor,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag_rounded),
            selectedIcon: const Icon(Icons.shopping_bag_rounded),
            selectedColor: selectedColor,
            unSelectedColor: unSelectedColor,
            title: const Text('Cart'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.favorite),
            selectedIcon: const Icon(Icons.favorite),
            selectedColor: selectedColor,
            unSelectedColor: unSelectedColor,
            title: const Text('Favorites'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.notifications),
            selectedIcon: const Icon(Icons.notifications_active),
            selectedColor: selectedColor,
            unSelectedColor: unSelectedColor,
            title: const Text('Notifications'),
          ),
        ],
        hasNotch: true,
        notchStyle: NotchStyle.circle,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: currentIndex,
        onTap: (index) {},
        option: AnimatedBarOptions(
          iconSize: 25,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          opacity: 0.4,
        ),
      ),
    );
  }
}
