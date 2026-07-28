import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/category_picker.dart';
import 'package:expensetracker/widgets/textfield/label_currency_field.dart';
import 'package:expensetracker/widgets/textfield/label_date_field.dart';
import 'package:expensetracker/widgets/textfield/labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});
  static const String id = "/addexpense";

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  Category _selected = Category.food;
  DateTime _selectedDate = DateTime.now();
  String _currency = 'USD';

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose(); // always last
  }

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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                debugPrint('title    = ${_titleController.text}');
                debugPrint('amount   = ${_amountController.text}');
                debugPrint('currency = $_currency');
                debugPrint('category = ${_selected.label}');
                debugPrint('date     = $_selectedDate');
                debugPrint('notes    = ${_notesController.text}');
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
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
            child: LabeledTextField(
              label: 'TITLE',
              hint: 'Coffee',
              width: 348,
              controller: _titleController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 7.0),
                child: LabeledTextField(
                  label: 'AMOUNT',
                  hint: '10.00',
                  width: 207,
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: LabelCurrencyField(
                  label: 'CURRENCY',
                  hint: 'USD',
                  width: 129,
                  onChanged: (code) => setState(() {
                    _currency = code;
                  }),
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
              child: LabelDateField(
                labelText: 'DATE',
                width: 348,
                selectedDate: _selectedDate,
                onChanged: (date) => setState(() => _selectedDate = date),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: LabeledTextField(
                label: 'NOTES',
                hint: 'Optional...',
                width: 348,
                controller: _notesController,
                multiline: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
