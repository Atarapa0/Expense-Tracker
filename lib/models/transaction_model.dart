import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0) // ✅ typeId: ekle
class TransactionModel {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final double amount;
  
  @HiveField(3)
  final DateTime dateTime;
  
  @HiveField(4)
  final TransactionType type;
  
  @HiveField(5)
  final Category category;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.type,
    required this.category
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionModel && other.id == id;
  }
  
  @override
  int get hashCode => id.hashCode;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'].toDouble(),
      dateTime: DateTime.parse(json['date']),
      type: TransactionType.values.byName(json['type']),
      category: Category.values.byName(json['category']),
    );
  }
}

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  Income,
  
  @HiveField(1)
  Expense,
}

@HiveType(typeId: 2)
enum Category {
  @HiveField(0)
  salary,
  
  @HiveField(1)
  freelancer,
  
  @HiveField(2)
  food,
  
  @HiveField(3)
  transportation,
  
  @HiveField(4)
  shopping,
  
  @HiveField(5)
  entertainment,
  
  @HiveField(6)
  subscriptions,
  
  @HiveField(7)
  other,
}

/*
class TransactionModel {
  final int id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final TransactionType type;
  final Category category;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.type,
    required this.category
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionModel && other.id == id;
  }
  @override
  int get hashCode => id.hashCode;

  
    factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'].toDouble(),
      dateTime: DateTime.parse(json['date']),
      type: TransactionType.values.byName(json['type']),
      category: Category.values.byName(json['category']),
    );
  }
}

enum TransactionType { income, expense }
enum Category{ salary,freelancer,food,transportation,shopping,entertainment,subscriptions,other }

*/