import 'package:flutter/material.dart';
import '../widgets/appbarbutton.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
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

      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 15,
              child: Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(16),
                color: Color(0xFFC98A1A),
                child: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),

            const Positioned(
              top: 100,
              left: 15,
              child: Text(
                'AMOUNT  . USD',
                style: TextStyle(color: Color(0xFF8B8785)),
              ),
            ),
            Positioned(
              top: 125,
              left: 40,
              right: 0,
              child: Text(
                'total anount here',
                style: TextStyle(color: Color(0xFF201E1D), fontSize: 35),
              ),
            ),

            Positioned(
              top: 182,
              left: 15,
              child: Text(
                "Laptop",
                style: TextStyle(color: Color(0xFF201E1D), fontSize: 26),
              ),
            ),

            Positioned(
              top: 230,
              left: 25,
              right: 25,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(thickness: 1, color: Colors.grey),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CATEGORY",
                        style: TextStyle(color: Color(0xFF8B8785)),
                      ),
                      Text(
                        "Bills",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(thickness: 0.4, color: Colors.grey),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DATE", style: TextStyle(color: Color(0xFF8B8785))),
                      Text(
                        "Jul 10, 2026",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(thickness: 0.4, color: Colors.grey),
                  SizedBox(height: 5),
                  Text("NOTES", style: TextStyle(color: Color(0xFF8B8785))),
                  SizedBox(height: 5),
                  Text(
                    "Work laptop — reimbursable through the Q3 equipment budget.",
                    style: TextStyle(color: Color(0xFF201E1D)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
