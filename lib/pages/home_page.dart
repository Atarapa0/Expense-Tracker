import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final balance = context
        .watch<TransactionProvider>()
        .balance;
    final income = context
        .watch<TransactionProvider>()
        .income;
    final expense = context
        .watch<TransactionProvider>()
        .expense;
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            balanceCard(balance, income, expense, context),
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
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
                            return transactionTile(item);
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