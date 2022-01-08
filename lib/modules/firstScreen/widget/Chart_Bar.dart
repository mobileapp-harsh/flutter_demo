import 'package:flutter/material.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text("\$ ${widget.spendingAmount.toStringAsFixed(0)}"),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Container(
          height: 80.0,
          width: 10.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: widget.spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorCommonConstants.DARKBLUECOLOR,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(widget.label),
      ],
    );
  }
}
