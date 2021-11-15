import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/orders_placed_card.dart';

class VendingMachinesPage extends StatelessWidget {
  const VendingMachinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                OrdersPlacedCard(ordersNumber: 20),
              ],
            )),
      ),
    );
  }
}
