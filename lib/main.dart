import 'package:expensetracker/screens/home_screen.dart';
import 'package:expensetracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/screens/home_screen.dart';
import 'package:expensetracker/screens/detail_screen.dart';
import 'package:expensetracker/widgets/empty_state.dart';
import 'package:expensetracker/core/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.light, // used in light mode
      darkTheme: AppTheme.dark, // used in dark mode
      themeMode: ThemeMode.system, // follows the phone setting
      home: const DetailScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
