import 'package:flutter/material.dart';
import '../models/expense.dart';

// Each category → its icon. Look up with categoryIcons[expense.category].
const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.restaurant_outlined,
  Category.groceries: Icons.shopping_basket_outlined,
  Category.transport: Icons.directions_bus_outlined,
  Category.bills: Icons.receipt_long_outlined,
  Category.entertainment: Icons.movie_outlined,
  Category.health: Icons.medical_services_outlined,
  Category.other: Icons.category_outlined,
};

// Each category → its color, from your design's palette.
const Map<Category, Color> categoryColors = {
  Category.food: Color(0xFFE3452A),
  Category.groceries: Color(0xFF3E8E5A),
  Category.transport: Color(0xFF2E6FB0),
  Category.bills: Color(0xFFC98A1A),
  Category.entertainment: Color(0xFF7A50C7),
  Category.health: Color(0xFF2FA0A8),
  Category.other: Color(0xFF6E6A69),
};
