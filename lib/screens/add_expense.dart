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
  final _formKey = GlobalKey<FormState>();
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

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(height: 2),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledTextField(
                label: 'TITLE',
                hint: 'Coffee',
                controller: _titleController,
              ),
              const SizedBox(height: 20),

              Row(
                // Fields have different heights — align their tops, not their centres.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 16, // the design's 1.6 : 1 ratio, as a proportion
                    child: LabeledTextField(
                      label: 'AMOUNT',
                      hint: '10.00',
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 10,
                    child: LabelCurrencyField(
                      label: 'CURRENCY',
                      value: _currency,
                      onChanged: (code) => setState(() => _currency = code),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'CATEGORY',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 8),
              CategoryPicker(
                selected: _selected,
                onChanged: (category) => setState(() => _selected = category),
              ),
              const SizedBox(height: 20),

              LabelDateField(
                labelText: 'DATE',
                selectedDate: _selectedDate,
                onChanged: (date) => setState(() => _selectedDate = date),
              ),
              const SizedBox(height: 20),

              LabeledTextField(
                label: 'NOTES',
                hint: 'Optional...',
                controller: _notesController,
                multiline: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
