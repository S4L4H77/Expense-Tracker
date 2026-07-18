import '../models/expense.dart';

// `final` (not const) because DateTime(...) isn't a compile-time constant.
final List<Expense> mockExpenses = [
  Expense(
    title: 'Coffee',
    amountMinor: 450,
    currency: 'USD',
    category: Category.food,
    date: DateTime(2026, 7, 17),
  ),
  Expense(
    title: 'Groceries',
    amountMinor: 8620,
    currency: 'USD',
    category: Category.groceries,
    date: DateTime(2026, 7, 16),
  ),
  Expense(
    title: 'Bus pass',
    amountMinor: 4500,
    currency: 'ILS',
    category: Category.transport,
    date: DateTime(2026, 7, 14),
  ),
  Expense(
    title: 'Laptop',
    amountMinor: 129900,
    currency: 'USD',
    category: Category.bills,
    date: DateTime(2026, 7, 10),
    notes: 'Work laptop — reimbursable through Q3 equipment budget.',
  ),
  Expense(
    title: 'Cinema',
    amountMinor: 1800,
    currency: 'GBP',
    category: Category.entertainment,
    date: DateTime(2026, 7, 8),
    notes: 'Friday night double feature with Sam.',
  ),
  Expense(
    title: 'Lunch',
    amountMinor: 320000,
    currency: 'JPY',
    category: Category.food,
    date: DateTime(2026, 7, 5),
  ),
  Expense(
    title: 'Pharmacy',
    amountMinor: 2240,
    currency: 'EUR',
    category: Category.health,
    date: DateTime(2026, 7, 2),
  ),
];
