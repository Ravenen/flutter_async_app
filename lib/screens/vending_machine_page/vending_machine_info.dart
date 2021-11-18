import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/order.dart';
import 'package:flutter_async_app/common/utils.dart';
import 'package:flutter_async_app/common/vending_machine.dart';
import 'package:flutter_async_app/common/vending_machine_api.dart';
import 'package:flutter_async_app/screens/loading_text.dart';
import 'package:flutter_async_app/screens/trade_mark_chip.dart';
import 'package:flutter_async_app/screens/vending_machine_page/info_text.dart';

class VendingMachineInfo extends StatelessWidget {
  const VendingMachineInfo({Key? key, required this.vendingMachineId})
      : super(key: key);

  final int vendingMachineId;

  List _buildOrders(List<Order> orders) {
    return orders.reversed
        .take(10)
        .map((order) => Card(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(getHoursMinutesFromTimestamp(order.timestamp),
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
                // leading:  Text(getHoursMinutesFromTimestamp(order.timestamp)),
                trailing: Text(order.price.toString()),
                title: Text(order.productName),
                subtitle: Text(order.tradeMark),
              ),
            ))
        .toList();
  }

  List<TradeMarkChip> _buildTradingMarksChips(List<String> tradeMarks) {
    return tradeMarks
        .map((tradeMark) => TradeMarkChip(tradeMark: tradeMark))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VendingMachine>(
        future: VendingMachineApi.getById(vendingMachineId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            VendingMachine vendingMachine = snapshot.data!;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        vendingMachine.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    vendingMachine.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(text: "Address: ${vendingMachine.address}"),
                    InfoText(text: "GPS: ${vendingMachine.gpsCoordinates}"),
                    InfoText(text: "Money: ${vendingMachine.amountOfMoney}"),
                    const InfoText(text: "Trade Marks: "),
                    Wrap(
                      children: [
                        ..._buildTradingMarksChips(vendingMachine.tradeMarks)
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Orders",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                ..._buildOrders(vendingMachine.orders),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const LoadingText();
        });
  }
}
