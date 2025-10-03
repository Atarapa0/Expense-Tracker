import 'package:expense_tracker/pages/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import '../providers/transaction_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<Category, IconData> categoryIcon = {
    Category.salary: Icons.attach_money,
    Category.freelancer: Icons.work_outline,
    Category.food: Icons.fastfood,
    Category.transportation: Icons.directions_car,
    Category.shopping: Icons.shopping_bag,
    Category.entertainment: Icons.movie,
    Category.subscriptions: Icons.subscriptions,
    Category.other: Icons.category,
  };

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
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text("₺ $balance", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 60,),
                          Icon(Icons.arrow_circle_up),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Income",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),
                              Text("₺ $income",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(width: 100),
                          Icon(Icons.arrow_circle_down),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("expense",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),
                              Text("₺ $expense",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
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
              //margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Transactions", style: TextStyle(fontSize: 20)),
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
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 0,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(categoryIcon[item.category]),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.title,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                item.category
                                                    .toString()
                                                    .split('.')
                                                    .last,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (item.type ==
                                              TransactionType.income)
                                            Text(
                                              "+ ₺ ${item.amount.toString()}",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          if (item.type ==
                                              TransactionType.expense)
                                            Text(
                                              "- ₺ ${item.amount.toString()}",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          Text(
                                            "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
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
