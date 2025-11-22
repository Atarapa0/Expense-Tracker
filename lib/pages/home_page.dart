import 'package:expense_tracker/widgets/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/balance_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late  Future<void> _initialFuture;
  @override
  void initState() {
    super.initState();
    _initialFuture = context.read<TransactionProvider>().loadTransactions();
    // Bu future sadece 1 kere oluşturuldu
  }
  void refreshUI() {
    setState(() {
      _initialFuture = context.read<TransactionProvider>().loadTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = context.select<TransactionProvider, double>(
      (p) => p.balance,
    );
    final income = context.select<TransactionProvider, double>((p) => p.income);
    final expense = context.select<TransactionProvider, double>(
      (p) => p.expense,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker"), actions: [IconButton(onPressed: refreshUI, icon: Icon(Icons.refresh))]),
      body: FutureBuilder(
        future: _initialFuture,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // 1. durum
          }
          if (asyncSnapshot.hasError) {
            return Center(
              child: Text('Hata oluştu${asyncSnapshot.error}'),
            ); // 2. durum
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                balanceCard(balance, income, expense, context),
                SizedBox(height: 0),
                transactions(),
              ],
            ),
          );
        },
      ),
    );
  }
}
 