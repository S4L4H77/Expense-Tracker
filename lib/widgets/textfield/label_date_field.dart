import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';
import 'package:intl/intl.dart';

class LabelDateField extends StatelessWidget {
  final String? labelText;
  final double width;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  const LabelDateField({
    super.key,
    required this.labelText,
    required this.width,
    required this.selectedDate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? 'DATE',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 5),

        SizedBox(
          width: width > 0 ? width : null,
          child: InkWell(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                onChanged(pickedDate);
              }
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.muted),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('MMM d, y').format(selectedDate),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: AppColors.muted,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
