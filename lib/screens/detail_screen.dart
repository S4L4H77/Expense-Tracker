import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';
import '../core/category_icons.dart';
import '../widgets/appbarbutton.dart';

class DetailScreen extends StatelessWidget {
  final Expense expense;
  const DetailScreen({super.key, required this.expense});
  static const String id = "/detailscreen";

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: appBarButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Center(
            child: appBarButton(icon: Icons.edit, onPressed: () {}),
          ),
          const SizedBox(width: 8),
          Center(
            child: appBarButton(
              icon: Icons.delete_outline,
              backgroundColor: const Color(0xFFEC3013),
              iconColor: Colors.white,
              border: false,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              color: categoryColors[expense.category],
              alignment: Alignment.center,
              child: Icon(
                categoryIcons[expense.category],
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'AMOUNT · ${expense.currency}',
              style: const TextStyle(color: Color(0xFF8B8785)),
            ),
            const SizedBox(height: 4),
            Text(
              expense.formattedAmount,
              style: TextStyle(
                color: onSurface,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              expense.title,
              style: TextStyle(color: onSurface, fontSize: 26),
            ),
            const SizedBox(height: 20),

            const Divider(thickness: 1),
            _detailRow('CATEGORY', expense.category.label, onSurface),
            const Divider(thickness: 0.4),
            _detailRow(
              'DATE',
              DateFormat('MMM d, y').format(expense.date),
              onSurface,
            ),
            const Divider(thickness: 0.4),

            const SizedBox(height: 12),
            const Text('NOTES', style: TextStyle(color: Color(0xFF8B8785))),
            const SizedBox(height: 5),
            Text(
              expense.notes ?? 'No notes', // ?? = fallback when notes is null
              style: TextStyle(
                color: expense.notes == null ? Colors.grey : onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A small helper so we don't repeat the same Row 2 times (CATEGORY, DATE).
  Widget _detailRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF8B8785))),
          Text(value, style: TextStyle(color: valueColor, fontSize: 15)),
        ],
      ),
    );
  }
}
