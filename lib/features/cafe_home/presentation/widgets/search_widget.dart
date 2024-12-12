import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 20),
      height: 50.h,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 24, 28, 38),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: null,
            icon: Image.asset(
              'assets/images/search_icon.png',
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     CupertinoIcons.search,
          //     color: Apptheme.iconColor,
          //   ),
          // ),
          Expanded(
            child: TextField(
              cursorColor: Apptheme.searchCursorColor,
              style: Apptheme.searchTextStyle.copyWith(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Find your coffee...',
                hintStyle: Apptheme.searchTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
