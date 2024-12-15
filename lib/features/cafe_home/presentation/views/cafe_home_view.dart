import 'package:caffeine_corner/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/utils/app_theme.dart';
import '../widgets/cafe_home_body.dart';

class CafeMain extends StatefulWidget {
  const CafeMain({super.key});
  static const routeName = '/cafe-main';

  @override
  State<CafeMain> createState() => _CafeMainState();
}

class _CafeMainState extends State<CafeMain> {
  int currentIndex = 0;
  List<Widget> screens = [const CafeHomeView(), const CartView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Apptheme.backgroundColor,
        body: screens[currentIndex],
        bottomNavigationBar: CustomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    const selectedColor = Apptheme.iconActiveColor;
    const unSelectedColor = Apptheme.iconColor;

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
        onTap: onTap,
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
