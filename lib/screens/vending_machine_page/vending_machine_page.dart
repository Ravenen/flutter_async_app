import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/screens/orders_placed_card.dart';
import 'package:flutter_async_app/screens/vending_machine_page/vending_machine_info.dart';

class VendingMachinePage extends StatelessWidget {
  const VendingMachinePage({Key? key, required this.vendingMachineId})
      : super(key: key);

  final int vendingMachineId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vending Machine"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          children: [
            const OrdersPlacedCard(),
            VendingMachineInfo(vendingMachineId: vendingMachineId),
          ],
        ),
      ),
    );
  }
}
