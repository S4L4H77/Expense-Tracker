import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

class LabelCurrencyField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final double width;
  final double? height;

  const LabelCurrencyField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? 'Default label',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.muted,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
          child: SizedBox(
            width: width > 0 ? width : null,
            child: DropdownButtonFormField<String>(
              hint: Text(hintText ?? 'Default hint'),
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
              items: const [
                DropdownMenuItem(value: 'USD', child: Text('USD')),
                DropdownMenuItem(value: 'SAR', child: Text('SAR')),
                DropdownMenuItem(value: 'EUR', child: Text('EUR')),
              ],
              onChanged: (value) {
                // save selected currency here
              },
            ),
          ),
        ),
      ],
    );
  }
}
