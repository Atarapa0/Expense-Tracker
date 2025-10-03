

import 'package:flutter/material.dart';

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

Container transactionTile(TransactionModel item) {
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
                  "${item.dateTime.day}/${item
                      .dateTime.month}/${item.dateTime
                      .year}",
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
}