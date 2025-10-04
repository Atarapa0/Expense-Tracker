import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  final TransactionType presetType;
  const AddTransactionPage({super.key, required this.presetType});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late TextEditingController _amountController = TextEditingController();
  late TextEditingController _commentController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory;
  String? _selectedType;


  final List<String> categories = [
    "salary",
    "freelancer",
    "food",
    "transportation",
    "shopping",
    "entertainment",
    "subscriptions",
    "other",
  ];
  final List<String> type = ["income", "expense"];

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _commentController = TextEditingController();
    _selectedType = widget.presetType.name;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }
  TransactionType parseType(String value) {
    return TransactionType.values.firstWhere(
          (e) => e.toString().split('.').last == value,
    );
  }

  Category parseCategory(String value) {
    return Category.values.firstWhere(
          (e) => e.toString().split('.').last == value,
    );
  }


  void addTransactions(BuildContext context){
    final title=_commentController.text.trim();
    final amount =double.tryParse(_amountController.text.trim());
    final date = _selectedDate;
    final types =_selectedType;
    final category =_selectedCategory;
    if(title.isNotEmpty &&
        amount != null &&
        amount > 0 &&
        date != null &&
        types != null &&
        category != null){
      final counter = context.read<TransactionProvider>();
      counter.addTransaction(title, amount, date, parseType(types), parseCategory(category));
      Navigator.of(context).pop();
      _amountController.clear();
      _commentController.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$_selectedType Add')));

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("gelir gider ekle")),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '₺ Amount',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Comment',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Date",
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: _presentDatePicker,
                ),
              ),
              controller: TextEditingController(
                text: _selectedDate == null
                    ? ""
                    : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(

              value: _selectedType,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Type",
              ),
              items: type.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Categories",
              ),
              items: categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => addTransactions(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Köşeleri yuvarla
                  ),
                ),
                child: Text(
                  "Save Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
