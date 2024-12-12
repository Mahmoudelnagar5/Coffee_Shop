import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';
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
                'coffe for you',
                style: Apptheme.titleLarge,
              ),
              const SizedBox(height: 20),
              const SearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
