import 'package:flutter/material.dart';
// import 'package:expensetracker/screens/home_screen.dart';
// import 'package:expensetracker/screens/detail_screen.dart';
import 'package:expensetracker/screens/empty_state_screen.dart';

void main() {
  runApp(
    MaterialApp(home: EmptyStateScreen(), debugShowCheckedModeBanner: false),
  );
}
