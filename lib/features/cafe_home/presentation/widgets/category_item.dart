import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';

class CategoeryItem extends StatelessWidget {
  const CategoeryItem({
    super.key,
    required this.coffe,
    required this.isActive,
  });

  final String coffe;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Text(
            coffe,
            style:
                isActive ? Apptheme.categoryActive : Apptheme.categoryInactive,
          ),
          const SizedBox(height: 2),
          Icon(
            Icons.circle,
            color: isActive ? Apptheme.iconActiveColor : Colors.transparent,
            size: 12,
          ),
        ],
      ),
    );
  }
}
