import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final void Function()? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.child,
    required this.onTap,
    this.borderRadius = 15,
    this.borderColor,
    this.borderWidth = 2,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth,
              ),
            ),
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : child),
            ),
          ),
        ),
      ),
    );
  }
}
