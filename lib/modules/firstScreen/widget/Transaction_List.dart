import 'package:flutter/material.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';
import 'package:flutter_demo/modules/firstScreen/modal/Transaction_Modal.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<TransactionModal> transactionList;
  const TransactionList({Key? key, required this.transactionList})
      : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      child: ListView.builder(
        itemCount: widget.transactionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorCommonConstants.BLUECOLOR, width: 2.0),
                      ),
                      child: Text(
                        "\$ " +
                            widget.transactionList[index].amount
                                .toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: ColorCommonConstants.BLUECOLOR),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.transactionList[index].title,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          DateFormat.yMMMd()
                              .format(widget.transactionList[index].date),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
