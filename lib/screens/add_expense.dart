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
  DateTime _selectedDate = DateTime.now();
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

          Center(
            child: textfield(
              context: context,

              labelText: 'TITLE',
              hintText: 'Coffee',
              width: 348,
              type: 'normal',
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 7.0),
                child: textfield(
                  context: context,
                  labelText: 'AMOUNT',
                  hintText: '10.00',
                  width: 207,
                  type: 'normal',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: textfield(
                  context: context,
                  labelText: 'CURRENCY',
                  hintText: 'USD',
                  width: 129,
                  type: 'currency',
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
            child: Text(
              "CATEGORY",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.muted,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 50.0),
            child: CategoryPicker(
              selected: _selected,
              onChanged: (category) => setState(() => _selected = category),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: textfield(
                context: context,
                labelText: 'DATE',
                width: 348,
                type: 'date',
                selectedDate: _selectedDate,
                onDateChanged: (date) {
                  setState(() => _selectedDate = date);
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: textfield(
                context: context,
                labelText: 'NOTES',
                hintText: 'Optional...',
                width: 348,
                height: 70,
                type: 'normal',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
