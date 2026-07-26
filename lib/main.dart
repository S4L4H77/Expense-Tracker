import 'package:expensetracker/screens/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/screens/home_screen.dart';
import 'package:expensetracker/core/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.light, // used in light mode
      darkTheme: AppTheme.dark, // used in dark mode
      themeMode: ThemeMode.system, // follows the phone setting
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
