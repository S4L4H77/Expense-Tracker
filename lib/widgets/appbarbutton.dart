import 'package:flutter/material.dart';

Widget appBarButton({
  required IconData icon,
  required VoidCallback onPressed,
  Color backgroundColor = Colors.white,
  Color iconColor = const Color(0xFF201E1D),
  bool border = true,
}) {
  return SizedBox(
    width: 38,
    height: 38,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ? Border.all(color: const Color(0xFFE0E0E1)) : null,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(width: 38, height: 38),
        icon: Icon(icon, color: iconColor, size: 20),
        onPressed: onPressed,
      ),
    ),
  );
}
