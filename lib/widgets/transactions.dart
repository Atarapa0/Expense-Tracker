 import 'package:flow_budget/providers/transaction_provider.dart';
import 'package:flow_budget/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Container transactions() {
    return Container(
                //margin: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Consumer<TransactionProvider>(
                      builder: (context, provider, __) {
                        var entries = provider.items;
                        if (entries.isEmpty) {
                          return Center(child: Text("No transactions yet"));
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: entries.length,
                          itemBuilder: (context, index) {
                            final item = entries[index];
                            return transactionTile(item, context);
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
  }

