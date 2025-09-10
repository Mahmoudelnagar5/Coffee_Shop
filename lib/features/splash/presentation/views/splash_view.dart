import 'package:animate_do/animate_do.dart';
import 'package:caffeine_corner/features/cafe_home/presentation/views/cafe_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../on_boarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.6) {
        _coffeeController.repeat();
      }
    });
    navgateToOnboarding();
  }

  navgateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, CafeMain.routeName);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Lottie.asset(
            'assets/images/coffeesplash.json',
            controller: _coffeeController,
            onLoaded: (composition) {
              _coffeeController
                ..duration = composition.duration
                ..forward();
            },
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'C A F F É I N E  C O R N E R',
                style: GoogleFonts.pacifico(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff632B13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
