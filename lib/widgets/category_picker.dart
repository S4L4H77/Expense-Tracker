import 'package:flutter/material.dart';
import '../core/category_icons.dart';
import '../core/theme.dart';
import '../models/expense.dart';

// The CATEGORY chips from design #05.
// Stateless on purpose: the form screen owns which category is selected and
// rebuilds us with a new `selected` value. We only report taps upward.
class CategoryPicker extends StatelessWidget {
  final Category selected;
  final ValueChanged<Category> onChanged; // = void Function(Category)

  const CategoryPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // gap between chips on the same line
      runSpacing: 8, // gap between lines
      // Category.values lists every enum value for free — add an 8th category
      // to the enum and this picker picks it up with no changes here.
      children: Category.values.map((category) {
        return _CategoryChip(
          category: category,
          isSelected: category == selected,
          onTap: () => onChanged(category),
        );
      }).toList(),
    );
  }
}

// Private (leading _) because nothing outside this file needs it.
class _CategoryChip extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Unselected borders are light grey on light, faint white on dark —
    // AppColors.divider would glow on a dark background.
    final borderColor = isSelected
        ? AppColors.accent
        : (isDark ? Colors.white24 : AppColors.divider);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44, // accessibility minimum touch target
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          // Chips sit on the #F7F6F5 page, so they need to be lighter than it
          // in light mode; in dark mode the border alone defines the shape.
          color: isDark ? Colors.transparent : Colors.white,
          border: Border.all(color: borderColor, width: isSelected ? 1.1 : 0.9),
        ),

        child: Row(
          // .min makes the Row hug its content instead of filling the width —
          // this is what gives each chip its own natural size.
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              color:
                  categoryColors[category], // reused from category_icons.dart
            ),
            const SizedBox(width: 8),
            Text(
              category.label, // reused from the CategoryLabel extension
              style: TextStyle(
                fontSize: 14,
                // Weight change so selection isn't signalled by colour alone.
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected
                    ? AppColors.accent
                    : Theme.of(context).colorScheme.onSurface,
                // color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
