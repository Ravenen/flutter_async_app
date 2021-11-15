import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrdersPlacedCard extends StatelessWidget {
  const OrdersPlacedCard({Key? key, required this.ordersNumber})
      : super(key: key);

  final int ordersNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Orders placed: $ordersNumber",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Text(
                  'during the app run',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
            TextButton(
              child: const Text(
                'Clear',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
