import 'package:flutter/material.dart';
import 'package:flutter_full_course/pages/main_page.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final Menus current;
  final Menus name;
  const BottomNavigationItem(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.current,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
              current == name ? Colors.black : Colors.black.withOpacity(0.3),
              BlendMode.srcIn),
        ));
  }
}
