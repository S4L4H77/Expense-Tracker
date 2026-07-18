import 'package:intl/intl.dart';

// An enum = a fixed set of allowed values. A category can ONLY be one of these.
enum Category {
  food,
  groceries,
  transport,
  bills,
  entertainment,
  health,
  other,
}

class Expense {
  final String title;
  final int
  amountMinor; // money as int: amount × 100 (e.g. $4.50 → 450). NEVER double.
  final String currency; // ISO code: 'USD', 'ILS', 'EUR', 'GBP', 'JPY'
  final Category category;
  final DateTime date;
  final String? notes; // the ? means it can be null (empty notes)

  const Expense({
    required this.title,
    required this.amountMinor,
    required this.currency,
    required this.category,
    required this.date,
    this.notes, // not required → optional
  });

  // A getter: formats the int back into a display string using the currency.
  // intl automatically picks the symbol and decimal places (JPY shows 0 decimals!).
  String get formattedAmount =>
      NumberFormat.simpleCurrency(name: currency).format(amountMinor / 100);
}

// An extension adds a helper onto Category without editing the enum itself.
// Turns Category.food into "Food" for display.
extension CategoryLabel on Category {
  String get label => name[0].toUpperCase() + name.substring(1);
}
