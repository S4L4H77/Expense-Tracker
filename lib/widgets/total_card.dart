import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalCard extends StatelessWidget {
  final int totalMinor;
  final int count;
  final String
  ratesDate; // ISO date (yyyy-MM-dd) the conversion rates came from
  const TotalCard({
    super.key,
    required this.totalMinor,
    required this.count,
    required this.ratesDate,
  });

  @override
  Widget build(BuildContext context) {
    final total = NumberFormat.simpleCurrency(
      name: 'USD',
    ).format(totalMinor / 100);
    final formattedRatesDate = DateFormat(
      'MMM d',
    ).format(DateTime.parse(ratesDate));

    return Container(
      width: double.infinity, // fills width → responsive (fixes width:345)
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFEC3013),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL · USD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Rates as of $formattedRatesDate',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            total,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'This month · $count expenses',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
