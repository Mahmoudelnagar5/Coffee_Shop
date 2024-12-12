import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onTap: () {},
          icon: Image.asset(
            'assets/images/menu_icon.png',
          ),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            'https://i.imgur.com/uTjWuc8.jpg',
            fit: BoxFit.fill,
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}
