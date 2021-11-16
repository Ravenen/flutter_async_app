import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine.dart';

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
              children: [
                SizedBox(
                  height: 200.0,
                  child: Ink.image(
                    image: NetworkImage(vendingMachine.imageUrl),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(vendingMachine.name),
                    subtitle: Text(vendingMachine.address),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ]),
        ),
    );
  }
}
