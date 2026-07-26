import 'package:flutter/material.dart';
import 'package:expensetracker/screens/home_screen.dart';
import 'package:expensetracker/core/theme.dart';

void main() => runApp(const ExpenseTrackerApp());

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
