import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';

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

Container transactionTile(TransactionModel item, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    child: Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<TransactionProvider>().deleteTransaction(item.id);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${item.title} deleted')));
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15), // 15 px radius
        ),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(categoryIcon[item.category]),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: TextStyle(fontSize: 16)),
                      Text(
                        item.category.toString().split('.').last,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (item.type == TransactionType.income)
                    Text(
                      "+ ₺ ${item.amount.toString()}",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (item.type == TransactionType.expense)
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
