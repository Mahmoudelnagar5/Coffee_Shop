import 'package:caffeine_corner/features/on_boarding/data/models/intro_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';
import '../widgets/custom_onboarding_buttons.dart';
import '../widgets/dots_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const String routeName = 'onboardingView';

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<IntroModel> introductionItems = IntroModel.introductionList;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemCount: introductionItems.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = introductionItems[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(item.image, fit: BoxFit.cover),
                  ),
                  Container(color: Apptheme.backgroundColor.withOpacity(0.7)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    alignment: const Alignment(0, 0.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.title,
                          style: Apptheme.introtitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item.subTitle,
                          style: Apptheme.introSubTile,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Page Indicator
          DotsIndicator(
            controller: controller,
            introductionItems: introductionItems,
          ),

          CustomOnBoardingButtons(
              controller: controller,
              introductionItems: introductionItems,
              currentPage: currentPage),
        ],
      ),
    );
  }
}
