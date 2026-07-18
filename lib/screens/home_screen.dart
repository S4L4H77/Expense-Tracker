import 'package:flutter/material.dart';
import '../data/mock_expenses.dart';
import '../services/exchange_rate_service.dart';
import '../widgets/total_card.dart';
import '../widgets/expense_list.dart';
import 'package:expensetracker/widgets/empty_state.dart';

// Expenses are stored in their original currency; the total is shown in this one.
const _baseCurrency = 'USD';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExchangeRates? _rates;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRates();
  }

  Future<void> _loadRates() async {
    setState(() => _error = null);
    // Only need rates for currencies other than the base — no point asking for USD/USD.
    final symbols = mockExpenses
        .map((e) => e.currency)
        .where((currency) => currency != _baseCurrency)
        .toSet()
        .toList();
    try {
      final rates = await ExchangeRateService.fetchLatest(
        base: _baseCurrency,
        symbols: symbols,
      );
      setState(() => _rates = rates);
    } catch (_) {
      setState(() => _error = 'Could not load exchange rates');
    }
  }

  // Converts a foreign-currency amount to base-currency minor units using the
  // fetched rate ("1 base = rate currency", so dividing undoes that).
  int _toBaseMinor(ExchangeRates rates) {
    return mockExpenses.fold<int>(0, (sum, e) {
      if (e.currency == _baseCurrency) return sum + e.amountMinor;
      final rate = rates.rates[e.currency];
      if (rate == null) {
        return sum; // shouldn't happen; API covers every symbol we asked for
      }
      return sum + (e.amountMinor / rate).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    final rates = _rates;

    Widget totalArea;
    if (rates != null) {
      totalArea = TotalCard(
        totalMinor: _toBaseMinor(rates),
        count: mockExpenses.length,
        ratesDate: rates.date,
      );
    } else if (_error != null) {
      totalArea = Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(child: Text(_error!)),
            TextButton(onPressed: _loadRates, child: const Text('Retry')),
          ],
        ),
      );
    } else {
      totalArea = const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.menu, size: 30), onPressed: () {}),
        ], // menu → actions
      ),

      body: mockExpenses.isEmpty
          ? const EmptyState() // no data → show empty state (inside Home's Scaffold)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                totalArea,
                const Padding(
                  padding: EdgeInsets.only(
                    top: 22,
                    left: 22,
                    right: 22,
                    bottom: 4,
                  ),
                  child: Text(
                    'RECENT',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B8785),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xFFE0E0EE),
                  thickness: 2,
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: mockExpenses.length,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    itemBuilder: (context, index) =>
                        ExpenseListTile(expense: mockExpenses[index]),
                  ),
                ),
              ],
            ),

      floatingActionButton: mockExpenses.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add, size: 30, color: Colors.white),
            ),
    );
  }
}
