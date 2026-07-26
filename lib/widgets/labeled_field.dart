import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';
import 'package:intl/intl.dart';

Widget textfield({
  required BuildContext context,
  String? labelText,
  String? hintText,
  double width = 0,
  double height = 0,
  String? type,
  DateTime? selectedDate,
  ValueChanged<DateTime>? onDateChanged,
}) {
  final isNotes = height > 0;
  if (type == 'normal') {
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
          padding: const EdgeInsets.only(left: .0, top: 5.0),
          child: SizedBox(
            width: width > 0 ? width : null,
            height: height > 0 ? height : null,
            child: TextField(
              expands: isNotes,
              maxLines: isNotes ? null : 1,
              textAlignVertical: isNotes ? TextAlignVertical.top : null,
              decoration: InputDecoration(
                hintText: hintText ?? 'Default hint',
                hintStyle: const TextStyle(color: AppColors.muted),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.muted),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.accent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  } else if (type == 'currency') {
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
              style: const TextStyle(
                color: AppColors.ink,
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
  } else if (type == 'date') {
    final date = selectedDate ?? DateTime.now();

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
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                onDateChanged?.call(pickedDate);
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
                    DateFormat('MMM d, y').format(date),
                    style: const TextStyle(
                      color: AppColors.ink,
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
  } else {
    return const SizedBox.shrink();
  }
}
