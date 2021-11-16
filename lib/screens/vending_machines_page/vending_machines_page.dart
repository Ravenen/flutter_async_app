import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/orders_placed_card.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machines_cards_list.dart';

class VendingMachinesPage extends StatelessWidget {
  const VendingMachinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Column(
              children: [
                OrdersPlacedCard(ordersNumber: 20),
                VendingMachinesCardsList()
              ],
            )),
      ),
    );
  }
}
