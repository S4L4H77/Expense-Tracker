import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/category_plcker.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';
import 'package:expensetracker/widgets/textfiled.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});
  static const String id = "/addexpense";

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  Category _selected = Category.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            icon: const Icon(Icons.close, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Center(
          child: const Text(
            'Add Expense',
            style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.bold),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              "Save",
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.muted, thickness: 1),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: textfield(
              labelText: 'TITLE',
              hintText: 'Coffee',
              width: 348,
              type: 'normal',
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 20.0,
                  right: 10.0,
                ),
                child: textfield(
                  labelText: 'AMOUNT',
                  hintText: '10.00',
                  width: 207,
                  type: 'normal',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                child: textfield(
                  labelText: 'CURRENCY',
                  hintText: 'USD',
                  width: 139,
                  type: 'currency',
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          CategoryPicker(
            selected: _selected,
            onChanged: (category) => setState(() => _selected = category),
          ),
        ],
      ),
    );
  }
}
