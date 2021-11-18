import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/data/vending_machine.dart';
import 'package:flutter_async_app/screens/vending_machine_page/vending_machine_page.dart';
import 'package:flutter_async_app/screens/trade_mark_chip.dart';

class VendingMachineCard extends StatelessWidget {
  const VendingMachineCard({Key? key, required this.vendingMachine})
      : super(key: key);

  final VendingMachine vendingMachine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.0,
                child: Ink.image(
                  image: NetworkImage(vendingMachine.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ListTile(
                  title: Text(vendingMachine.name),
                  subtitle: Text(vendingMachine.address),
                ),
              ),
              Wrap(
                children: vendingMachine.tradeMarks
                    .map((tradeMark) => TradeMarkChip(tradeMark: tradeMark))
                    .toList(),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VendingMachinePage(
                        vendingMachineId: vendingMachine.id,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
