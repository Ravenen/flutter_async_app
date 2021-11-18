import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/orders_placed_event.dart';
import 'package:provider/provider.dart';

import '../common/orders_placed_bloc.dart';

class OrdersPlacedCard extends StatelessWidget {
  const OrdersPlacedCard({Key? key}) : super(key: key);

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
                Consumer<OrdersPlacedBloc>(
                    builder: (context, _ordersPlacedBloc, child) {
                  return StreamBuilder<int>(
                      stream: _ordersPlacedBloc.ordersPlaced,
                      builder: (context, snapshot) {
                        return Text(
                          "Orders placed: ${snapshot.hasData ? snapshot.data : ""}",
                          style: const TextStyle(fontSize: 16.0),
                        );
                      });
                }),
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
              onPressed: () {
                Provider.of<OrdersPlacedBloc>(context, listen: false)
                    .ordersPlacedEventSink
                    .add(ClearEvent());
              },
            )
          ],
        ),
      ),
    );
  }
}
