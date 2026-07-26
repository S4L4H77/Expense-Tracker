import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color?
  backgroundColor; // null → transparent (the design's bordered box)
  final Color? iconColor; // null → follows the theme
  final bool border;

  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.border = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: 38,
      height: 38,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          border: border ? Border.all(color: colors.outlineVariant) : null,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints.tightFor(width: 38, height: 38),
          icon: Icon(icon, color: iconColor ?? colors.onSurface, size: 20),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
