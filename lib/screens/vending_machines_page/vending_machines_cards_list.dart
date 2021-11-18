import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine.dart';
import 'package:flutter_async_app/common/vending_machine_api.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machine_card.dart';

class VendingMachinesCardsList extends StatelessWidget {
  const VendingMachinesCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VendingMachine>>(
        future: VendingMachineApi.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return VendingMachineCard(
                      vendingMachine: snapshot.data![index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(child: Text("Loading...")),
          );
        });
  }
}
