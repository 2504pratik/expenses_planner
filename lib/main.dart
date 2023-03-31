import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import './pages/home_page.dart';

import 'package:flutter/material.dart';

import 'data/expense_data.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('expense_db');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: 'RobotoSerif'),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
