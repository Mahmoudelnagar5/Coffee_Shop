import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme.dart';

class DescriptionView extends StatelessWidget {
  final String description;
  const DescriptionView({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Apptheme.descriptionTitle,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Apptheme.descriptionContent,
          ),
        ],
      ),
    );
  }
}
