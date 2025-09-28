import 'package:expense_tracker/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _items = [];
  int _idCounter = 1;
  double totalIncome = 0;
  double totalExpense = 0;
  double totalBalance=0;
  void addTransaction(
    String title,
    double amount,
    DateTime dateTime,
    TransactionType type,
    Category category,
  ) {
    if (amount > 0) {
      var items = TransactionModel(
        id: _idCounter++,
        title: title,
        amount: amount,
        dateTime: dateTime,
        type: type,
        category: category,
      );
      if (items.type == TransactionType.income) {
        totalBalance+=items.amount;
        _items.add(items);
        notifyListeners();
        if(items.category==Category.salary || items.category==Category.freelancer){
          totalIncome += items.amount;
          _items.add(items);
          notifyListeners();
        }
      } else if (items.type == TransactionType.expense) {
        totalExpense += items.amount;
        totalBalance-=items.amount;
        _items.add(items);
        notifyListeners();
      } else {
        ScaffoldMessenger(child: ScaffoldMessenger(child: Text("Error")));

      }
    } else {
      ScaffoldMessenger(child: ScaffoldMessenger(child: Text("Error")));
    }
  }



}
