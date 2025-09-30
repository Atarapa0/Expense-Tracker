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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 40,
                bottom: 30,
              ),
              margin: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(250),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text("Mevcut bakiye:"),
                  SizedBox(height: 10),
                  Text("₺ 25000"),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gelir"),
                          SizedBox(height: 5),
                          Text("12312"),
                        ],
                      ),
                      SizedBox(width: 50),
                      Icon(Icons.remove),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gider"),
                          SizedBox(height: 5),
                          Text("12312"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('gelir ekle'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('gider ekle'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(250),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Son işlemler")

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
