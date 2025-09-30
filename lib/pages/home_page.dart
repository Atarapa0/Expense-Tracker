import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      body: Positioned(
        left: 30,
        right: 30,
        top: 30,
        bottom: 30,
        child: Column(
          children: [
            Text("MEvcut bakiye:"),
            SizedBox(height: 10),
            Text("₺ 25000"),
            Row(
              children: [
                Icon(Icons.add),

              ],
            )
          ],
        ),
      ),
    );
  }
}
