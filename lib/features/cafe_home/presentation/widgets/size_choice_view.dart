import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';

class SizeChoiceView extends StatefulWidget {
  const SizeChoiceView({super.key});

  @override
  State<SizeChoiceView> createState() => _SizeChoiceViewState();
}

class _SizeChoiceViewState extends State<SizeChoiceView> {
  final List<String> sizes = ['S', 'M', 'L']; // List of sizes
  int selectedIndex = 0; // Tracks the selected size index

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizes.map((size) {
        final isSelected = sizes.indexOf(size) == selectedIndex;
        return CustomButton(
          onTap: () {
            setState(() {
              selectedIndex = sizes.indexOf(size); // Update active size
            });
          },
          width: 91.w,
          height: 36.h,
          color: isSelected
              ? Apptheme.buttonBackground2Color
              : Apptheme.buttonBackground2Color,
          borderColor:
              isSelected ? Apptheme.buttonBorderColor : Colors.transparent,
          child: Text(
            size,
            style: isSelected
                ? Apptheme.buttonActiveTextStyle
                : Apptheme.buttonInactiveTextStyle,
          ),
        );
      }).toList(),
    );
  }
}
