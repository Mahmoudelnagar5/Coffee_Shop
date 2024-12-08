import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Auth/presentation/views/login_view.dart';
import 'features/on_boarding/presentation/views/onboarding_view.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
            LoginView.routeName: (context) => const LoginView(),
            OnboardingView.routeName: (context) => const OnboardingView(),
          },
        );
      },
      child: const SplashView(),
    );
  }
}
