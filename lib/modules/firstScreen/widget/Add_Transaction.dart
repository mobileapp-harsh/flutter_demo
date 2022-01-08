import 'package:flutter/material.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';
import 'package:get/get.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;
  const AddTransaction({Key? key, required this.addTransaction})
      : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController _titleInputController = TextEditingController();
  TextEditingController _amountInputController = TextEditingController();

  void submitData() {
    final titleText = _titleInputController.text;
    final amountText = double.parse(_amountInputController.text);
    if (titleText.isEmpty || amountText <= 0) {
      return;
    }
    widget.addTransaction(titleText, amountText);
    _titleInputController.clear();
    _amountInputController.clear();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        child: Card(
          elevation: 2.0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleInputController,
                  decoration: InputDecoration(labelText: "Title"),
                  onSubmitted: (_) => submitData,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _amountInputController,
                  decoration: InputDecoration(labelText: "Amount"),
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("No Date Chosen!"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Choose Date",
                          style: TextStyle(
                              color: ColorCommonConstants.DARKBLUECOLOR,
                              fontSize: 16.0),
                        ),
                      ),
                    ]),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    submitData();
                  },
                  child: const Text("Add Transaction"),
                  style: ElevatedButton.styleFrom(
                      primary: ColorCommonConstants.DARKBLUECOLOR),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
