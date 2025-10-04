import 'package:flutter/material.dart';

import '../models/transaction_model.dart';
import '../pages/add_transaction_page.dart';

Container balanceCard(double balance, double income, double expense, BuildContext context) {
  return Container(
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
                  builder: (context) =>  AddTransactionPage(presetType: TransactionType.income),
                ),
              ),
              child: const Text('Income Add'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AddTransactionPage(presetType: TransactionType.expense),
                ),
              ),
              child: const Text('Expense Add'),
            ),
          ],
        ),
      ],
    ),
  );
}

