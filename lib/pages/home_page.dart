import 'package:flutter/material.dart';
import 'package:kharcha/components/greeting.dart';
import 'package:kharcha/components/navbar.dart';
import 'package:provider/provider.dart';

import '../components/expense_summary.dart';
import '../components/expense_tile.dart';
import '../data/expense_data.dart';
import '../models/expense_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void deleteExpense(ExpenseItem expenseItem) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expenseItem);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffb57bee),
              Color(0xff392d69),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          bottomNavigationBar: const NavBar(),
          backgroundColor: Colors.transparent,
          body: ListView(
            shrinkWrap: true,
            children: [
              const Greeting(),
              const SizedBox(
                height: 20,
              ),
              ExpenseSummary(startofWeek: value.startOfWeekDate()),
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Expense: ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => ExpenseTile(
                  name: value.getAllExpenseList()[index].name,
                  amount: value.getAllExpenseList()[index].amount,
                  dateTime: value.getAllExpenseList()[index].dateTime,
                  deleteTrapped: (context) =>
                      deleteExpense(value.getAllExpenseList()[index]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
