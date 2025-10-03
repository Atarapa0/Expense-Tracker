import 'package:expense_tracker/models/transaction_model.dart';
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(250),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Transactions"),
                  Consumer<TransactionProvider>(
                    builder: (context, provider, __) {
                      var entries = provider.items;
                      if (entries.isEmpty) {
                        return Center(child: Text("No transactions yet"));
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 4 / 5,
                        ),
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final item = entries[index];
                          return Card(
                            child: Column(
                              children: [
                                Text(item.title),
                                Text("₺ ${item.amount}"),
                                Text(item.type.toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
