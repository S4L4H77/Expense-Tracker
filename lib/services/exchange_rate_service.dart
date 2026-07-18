import 'dart:convert';
import 'package:http/http.dart' as http;

// Rates come back as "1 [base] = rate [currency]" (e.g. base USD, EUR: 0.87
// means $1 = €0.87). Divide a foreign amount by its rate to convert to base.
class ExchangeRates {
  final String base;
  final String date;
  final Map<String, double> rates;

  const ExchangeRates({
    required this.base,
    required this.date,
    required this.rates,
  });
}

class ExchangeRateService {
  // Free, no-auth-required ECB-based rates API: https://frankfurter.dev
  static const _host = 'api.frankfurter.dev';

  static Future<ExchangeRates> fetchLatest({
    required String base,
    required List<String> symbols,
  }) async {
    final uri = Uri.https(_host, '/v1/latest', {
      'base': base,
      if (symbols.isNotEmpty) 'symbols': symbols.join(','),
    });

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load exchange rates (${response.statusCode})');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final rawRates = data['rates'] as Map<String, dynamic>;

    return ExchangeRates(
      base: data['base'] as String,
      date: data['date'] as String,
      rates: rawRates.map((k, v) => MapEntry(k, (v as num).toDouble())),
    );
  }
}
