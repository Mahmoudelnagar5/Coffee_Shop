import 'package:caffeine_corner/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Auth/presentation/views/sign_in_view.dart';
import 'features/Auth/presentation/views/sign_up_view.dart';
import 'features/on_boarding/presentation/views/onboarding_view.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee Shop',
          home: child,
          routes: {
            SplashView.routeName: (context) => const SplashView(),
            OnboardingView.routeName: (context) => const OnboardingView(),
            SignInView.routeName: (context) => const SignInView(),
            SignUpView.routeName: (context) => const SignUpView(),
          },
        );
      },
      child: const SplashView(),
    );
  }
}
