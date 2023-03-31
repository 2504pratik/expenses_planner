import 'package:flutter/material.dart';
import 'package:kharcha/pages/calendar_page.dart';
import 'package:kharcha/pages/chat_page.dart';

import 'package:kharcha/pages/profile_page.dart';

import 'package:provider/provider.dart';

import '../data/expense_data.dart';
import '../models/expense_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(hintText: 'Amount'),
              keyboardType: TextInputType.number,
            )
          ],
        ),
        actions: [
          Card(
            color: const Color(0xff592e83),
            child: MaterialButton(
              onPressed: save,
              child: const Text(
                'Save',
                style: TextStyle(color: Color(0xffcaa8f5)),
              ),
            ),
          ),
          Card(
            color: const Color(0xffcaa8f5),
            child: MaterialButton(
              onPressed: cancel,
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xff592e83)),
              ),
            ),
          )
        ],
      ),
    );
  }

  void save() {
    if (_nameController.text.isNotEmpty && _amountController.text.isNotEmpty) {
      ExpenseItem newExpense = ExpenseItem(
          name: _nameController.text,
          amount: _amountController.text,
          dateTime: DateTime.now());
      Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);
    }
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    _nameController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.home_rounded,
                  color: Color(0xFF9299A1),
                  size: 26,
                ),
                onPressed: () {},
              ),
              IconButton(
                hoverColor: Colors.transparent,
                iconSize: 50,
                icon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ChatPage()));
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      iconSize: 60,
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xffcaa8f5),
                        size: 40,
                      ),
                      onPressed: addNewExpense,
                    ),
                  ),
                ],
              ),
              IconButton(
                hoverColor: Colors.transparent,
                iconSize: 50,
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CalendarPage()));
                },
              ),
              IconButton(
                hoverColor: Colors.transparent,
                iconSize: 50,
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
