import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

class LabelCurrencyField extends StatelessWidget {
  static const List<String> currencies = ['USD', 'ILS', 'GBP', 'JPY', 'EUR'];
  final String? label;
  final String? hint;
  final double width;
  final ValueChanged<String> onChanged;

  const LabelCurrencyField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? 'Default label',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 5),

        SizedBox(
          width: width > 0 ? width : null,
          child: DropdownButtonFormField<String>(
            // hint: Text(hint ?? 'Default hint'),
            initialValue: hint,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.muted),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.accent),
              ),
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            items: currencies
                .map((code) => DropdownMenuItem(value: code, child: Text(code)))
                .toList(),
            onChanged: (selected) {
              if (selected != null) onChanged(selected);
            },
          ),
        ),
      ],
    );
  }
}
