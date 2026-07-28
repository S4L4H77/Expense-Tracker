// import 'package:expensetracker/data/mock_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/screens/home_screen.dart';
import 'package:expensetracker/core/theme.dart';

void main() {
  // final a = mockExpenses[0];
  // final b = a.copyWith(amountMinor: 500);

  // print('a.id = ${a.id}');
  // print('b.id = ${b.id}');
  // print('a = ${a.amountMinor}'); // 450 — the original is untouched
  // print('b = ${b.amountMinor}');
  // print(mockExpenses.map((e) => e.id).toSet().length);

  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.light, // used in light mode
    darkTheme: AppTheme.dark, // used in dark mode
    themeMode: ThemeMode.system, // follows the phone setting
    home: const HomeScreen(),
    debugShowCheckedModeBanner: false,
  );
}
