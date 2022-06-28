import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum = 0;

      for (var tr in recentTransactions) {
        if (tr.date.day == weekDay.day &&
            tr.date.month == weekDay.month &&
            tr.date.year == weekDay.year) {
          daySum += tr.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(daySum);

      return {
        'Day': DateFormat.E().format(weekDay),
        'Amount': daySum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactionValues;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [],
      ),
    );
  }
}
