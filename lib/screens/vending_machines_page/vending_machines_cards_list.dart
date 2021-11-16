import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machine_card.dart';
import 'package:http/http.dart' as http;


class VendingMachinesCardsList extends StatefulWidget {
  const VendingMachinesCardsList({Key? key}) : super(key: key);

  @override
  _VendingMachinesCardsListState createState() =>
      _VendingMachinesCardsListState();
}

class _VendingMachinesCardsListState extends State<VendingMachinesCardsList> {
  late Future<List<VendingMachine>> futureVendingMachineList;

  @override
  void initState() {
    super.initState();
    futureVendingMachineList = fetchVendingMachines();
  }

  Future<List<VendingMachine>> fetchVendingMachines() async {
    final response = await http.get(Uri.parse("https://e4c577p993.execute-api.us-east-2.amazonaws.com/dev/vending_machine/"));
    List data = List.from(jsonDecode(response.body));
    List<VendingMachine> vendingMachineList =
        data.map((item) => VendingMachine.fromJson(item)).toList();
    return Future.delayed(const Duration(seconds: 5), () => vendingMachineList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VendingMachine>>(
        future: futureVendingMachineList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return VendingMachineCard(vendingMachine: snapshot.data![index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(
                child: Text("Loading...")),
          );
        });
  }
}
