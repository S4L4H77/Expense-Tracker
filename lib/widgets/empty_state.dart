import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              border: Border.all(color: onSurface, width: 2),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 50,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No expenses yet',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
            width: 314,
            child: Text(
              'Add your first expense to start tracking your monthly total.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: AppColors.muted),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 20),
            label: const Text(
              'Add expense',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
