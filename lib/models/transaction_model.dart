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
      dateTime: DateTime.parse(json['dateTime']),
      type: TransactionType.values.byName(json['type']),
      category: Category.values.byName(json['category']),
    );
  }
}

enum TransactionType { income, expense }
enum Category{ salary,freelancer,food,transportation,shopping,entertainment,subscriptions,other }

