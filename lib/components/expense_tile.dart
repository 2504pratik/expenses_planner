import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext context)? deleteTrapped;

  ExpenseTile(
      {required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTrapped,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTrapped,
              icon: Icons.delete,
              backgroundColor: const Color.fromRGBO(20, 20, 41, 1),
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: ListTileTheme(
          tileColor: const Color(0xffcaa8f5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              name,
              style: const TextStyle(
                  color: Color.fromRGBO(20, 20, 41, 1), fontSize: 20),
            ),
            subtitle: Text(
              '${dateTime.day}/${dateTime.month}/${dateTime.year}',
              style: const TextStyle(color: Color.fromRGBO(20, 20, 41, 1)),
            ),
            trailing: Text(
              'Rs.$amount',
              style: const TextStyle(
                  color: Color.fromRGBO(20, 20, 41, 1), fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
