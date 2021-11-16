import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'orders_placed_bloc.dart';

class OrdersPlacedCard extends StatelessWidget {
  OrdersPlacedCard({Key? key}) : super(key: key);

  final _bloc = OrdersPlacedBloc();

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
                StreamBuilder<int>(
                  stream: _bloc.ordersPlaced,
                  builder: (context, snapshot) {
                    return Text(
                      "Orders placed: ${snapshot.data}",
                      style: const TextStyle(fontSize: 16.0),
                    );
                  }
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
