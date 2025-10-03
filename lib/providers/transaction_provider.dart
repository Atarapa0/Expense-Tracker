import 'package:expense_tracker/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _items = [];
  List<TransactionModel> get items => List.unmodifiable(_items);
  int _idCounter = 1;
  void addTransaction(
    String title,
    double amount,
    DateTime dateTime,
    TransactionType type,
    Category category,
  ) {
    if (amount > 0) {
      var tx = TransactionModel(
        id: _idCounter++,
        title: title,
        amount: amount,
        dateTime: dateTime,
        type: type,
        category: category,
      );
      _items.add(tx);
      _items.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      notifyListeners();
    } else {
      return;
    }
  }

  double get income {
    return _items
        .where((tx) => tx.type == TransactionType.income)
        .fold(0, (sum, tx) => sum + tx.amount);
  }

  double get expense {
    return _items
        .where((tx) => tx.type == TransactionType.expense)
        .fold(0, (sum, tx) => sum + tx.amount);
  }

  double get balance => income - expense;
}
