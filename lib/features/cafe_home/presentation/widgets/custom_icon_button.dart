import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget icon;

  const CustomIconButton({
    super.key,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: icon,
    );
  }
}
