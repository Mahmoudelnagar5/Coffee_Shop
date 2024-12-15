import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';

class CustomCartBar extends StatelessWidget {
  const CustomCartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cart',
      style: Apptheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
