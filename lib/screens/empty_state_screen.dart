import 'package:flutter/material.dart';

class EmptyStateScreen extends StatelessWidget {
  const EmptyStateScreen({super.key});
  static const String id = "/emptystatescreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F5),

      appBar: AppBar(
        title: const Text(
          'Expenses',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.menu, size: 30), onPressed: () {}),
        ],
        backgroundColor: const Color(0xFFF7F6F5), // menu → actions
      ),

      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 50,
                color: Color(0xFFEC3013),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "No expenses yet",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            SizedBox(
              width: 314,
              child: Center(
                child: Text(
                  "Add your first expense to start tracking your monthly total.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Color(0xFF8B8785)),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 180,
              child: ElevatedButton.icon(
                onPressed: () {
                  // What happens when the user taps it
                },
                icon: const Icon(Icons.add, size: 20),
                label: const Text(
                  'Add expense',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEC3013),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
