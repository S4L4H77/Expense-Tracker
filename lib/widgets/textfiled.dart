import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

Widget textfield({
  String? labelText,
  String? hintText,
  double width = 0,
  String? type,
}) {
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
          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
          child: SizedBox(
            width: width > 0 ? width : 0,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText ?? 'Default hint',
                hintStyle: const TextStyle(color: AppColors.muted),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.ink),
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
            width: width > 0 ? width : 0,
            child: DropdownButtonFormField<String>(
              hint: Text(hintText ?? 'Default hint'),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.ink),
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
  } else {
    return Container(); // Return an empty container for unsupported types
  }
}
