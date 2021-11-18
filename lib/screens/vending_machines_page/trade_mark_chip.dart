import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TradeMarkChip extends StatelessWidget {
  const TradeMarkChip({Key? key, required this.tradeMark}) : super(key: key);

  final String tradeMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(tradeMark),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}
