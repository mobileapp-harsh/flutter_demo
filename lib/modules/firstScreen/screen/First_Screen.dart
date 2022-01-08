// ignore_for_file: dead_code

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';
import 'package:flutter_demo/modules/firstScreen/modal/Transaction_Modal.dart';
import 'package:flutter_demo/modules/firstScreen/widget/Add_Transaction.dart';
import 'package:flutter_demo/modules/firstScreen/widget/Char.dart';
import 'package:flutter_demo/modules/firstScreen/widget/Transaction_List.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final List<TransactionModal> transactionList = [];

  List<TransactionModal> get newlyTransaction {
    return transactionList.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount) {
    final newTransaction = TransactionModal(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      transactionList.add(newTransaction);
    });
  }

  late String titleInput;
  late String amountInput;

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: AddTransaction(addTransaction: _addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Flutter Moon"),
          centerTitle: false,
          backgroundColor: ColorCommonConstants.DARKBLUECOLOR,
          actions: [
            IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ChatWidget(newlyTransaction: newlyTransaction),
            Expanded(child: TransactionList(transactionList: transactionList))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorCommonConstants.DARKBLUECOLOR,
          child: const Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ),
    );
  }
}
