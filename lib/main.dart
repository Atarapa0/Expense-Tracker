import 'dart:io';
import 'package:expense_tracker/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'pages/home_page.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

  // 1) Hive'i başlat - path_provider kullanmadan
  final dir = Directory.systemTemp; // sadece öğrenme için, geçici klasör
  Hive.init(dir.path);

  // 2) Adapter'ları kaydet
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  Hive.registerAdapter(CategoryAdapter());

  // 3) Box aç
  final box = await Hive.openBox<TransactionModel>('transactions');

  // 4) Provider'a box verip app'i başlat
  runApp(
    ChangeNotifierProvider(
      create: (_) => TransactionProvider(box),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

