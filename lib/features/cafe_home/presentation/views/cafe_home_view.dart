import 'package:flutter/material.dart';

class CafeHomeView extends StatelessWidget {
  const CafeHomeView({super.key});
  static const String routeName = '/cafe-home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Cafe Home',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
