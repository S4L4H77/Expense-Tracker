import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

class LabeledTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final double width;
  final double? height;

  const LabeledTextField({
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
          padding: const EdgeInsets.only(left: .0, top: 5.0),
          child: SizedBox(
            width: width > 0 ? width : null,
            height: height! > 0 ? height! : null,
            child: TextField(
              expands: height! > 0,
              maxLines: height! > 0 ? null : 1,
              textAlignVertical: height! > 0 ? TextAlignVertical.top : null,
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
  }
}
