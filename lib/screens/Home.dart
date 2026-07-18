import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/homescreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  final transactions = [
    {
      'title': 'Coffee',
      'subtitle': 'Today · Food',
      'amount': '\$4.50',
      'icon': Icons.coffee_outlined,
      'color': Colors.red,
    },
    {
      'title': 'Groceries',
      'subtitle': 'Yesterday · Groceries',
      'amount': '\$86.20',
      'icon': Icons.shopping_basket_outlined,
      'color': Colors.green,
    },
    {
      'title': 'Bus pass',
      'subtitle': 'Jul 14 · Transport',
      'amount': '\$12.15',
      'icon': Icons.directions_bus_outlined,
      'color': Colors.blue,
    },
    {
      'title': 'Laptop',
      'subtitle': 'Jul 10 · Bills',
      'amount': '\$1,299.00',
      'icon': Icons.receipt_long_outlined,
      'color': Colors.orange,
    },
    {
      'title': 'Cinema',
      'subtitle': 'Jul 8 · Entertainment',
      'amount': '\$23.40',
      'icon': Icons.movie_outlined,
      'color': Colors.deepPurple,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F5),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Expenses',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.menu, size: 30),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              color: const Color(0xFFEC3013),
              width: 345,
              height: 135,
              child: Container(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total  .  100 USD',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),

                        Text(
                          'Release as of Jul 17',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    Text(
                      '1400.90 Dollar ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'This month . 7expenses',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 22.0,
              left: 22.0,
              right: 22.0,
              bottom: 4.0,
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
            height: 5, // space the divider occupies vertically
          ),

          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              itemBuilder: (context, index) {
                final item = transactions[index];

                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Colored icon box
                      Container(
                        width: 42,
                        height: 45,
                        color: item['color'] as Color,
                        child: Icon(
                          item['icon'] as IconData,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Title and date/category
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF201E1D),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item['subtitle'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8B8785),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Amount
                      Text(
                        item['amount'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF201E1D),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when the button is pressed
        },
        backgroundColor: const Color(0xFFEC3013),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
