import 'package:expense_tracker/pages/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final balance = context.watch<TransactionProvider>().balance;
    final income = context.watch<TransactionProvider>().income;
    final expense = context.watch<TransactionProvider>().expense;
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 40,
                bottom: 30,
              ),
              margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(250),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance:"),
                  SizedBox(height: 10),
                  Text("₺ $balance"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Income"),
                              SizedBox(height: 5),
                              Text("₺ $income"),
                            ],
                          ),
                          SizedBox(width: 50),
                          Icon(Icons.remove),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("expense"),
                              SizedBox(height: 5),
                              Text("₺ $expense"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTransactionPage(),
                          ),
                        ),
                        child: const Text('Income Add'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTransactionPage(),
                          ),
                        ),
                        child: const Text('Expense Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Transactions"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Consumer<TransactionProvider>(
                      builder: (context, provider, __) {
                        var entries = provider.items;
                        if (entries.isEmpty) {
                          return Center(child: Text("No transactions yet"));
                        }
                        return ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (context, index) {
                            final item = entries[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Kart araları
                              child: Card(
                                color: Colors.pink,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Icon"),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(item.title),
                                              Text(item.category.toString().split('.').last),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(item.amount.toString()),
                                          Text("${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );


                      },
                    ),
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
