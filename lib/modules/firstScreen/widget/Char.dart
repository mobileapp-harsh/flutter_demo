import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/firstScreen/modal/Transaction_Modal.dart';
import 'package:flutter_demo/modules/firstScreen/widget/Chart_Bar.dart';
import 'package:intl/intl.dart';

class ChatWidget extends StatefulWidget {
  List<TransactionModal> newlyTransaction;
  ChatWidget({Key? key, required this.newlyTransaction}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekOfTheDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (int i = 0; i < widget.newlyTransaction.length; i++) {
          if (widget.newlyTransaction[i].date.day == weekOfTheDay.day &&
              widget.newlyTransaction[i].date.month == weekOfTheDay.month &&
              widget.newlyTransaction[i].date.year == weekOfTheDay.year) {
            totalSum += widget.newlyTransaction[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekOfTheDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get maximumSpending {
    return groupedTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print("group Transaction : ${groupedTransactions}");
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(12.0),
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'],
                    e['amount'],
                    maximumSpending == 0.0
                        ? 0.0
                        : e['amount'] / maximumSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
