import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine.dart';

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
    String testJson =
        "[\n{\n\"address\": {\n\"building\": \"12\",\n\"id\": 1,\n\"street\": {\n\"city\": {\n\"id\": 1,\n\"name\": \"Lviv\",\n\"region\": {\n\"country\": {\n\"id\": 1,\n\"name\": \"Ukraine\"\n},\n\"country_id\": 1,\n\"id\": 1,\n\"name\": \"Lvivska oblast\"\n},\n\"region_id\": 1\n},\n\"city_id\": 1,\n\"id\": 1,\n\"name\": \"Bohdana Khmelnytskoho\"\n},\n\"street_id\": 1\n},\n\"address_id\": 1,\n\"amount_of_money\": 0,\n\"gps_coordinates\": \"49.845773, 24.028031\",\n\"id\": 1,\n\"image_url\": \"https:\/\/images.unsplash.com\/photo-1618506557292-ec1862b3c506?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1171&q=80\",\n\"name\": \"McDonalds Food\",\n\"trade_marks\": [\n\"Flint\",\n\"Chipsters\"\n]\n},\n{\n\"address\": {\n\"building\": \"3A\",\n\"id\": 2,\n\"street\": {\n\"city\": {\n\"id\": 1,\n\"name\": \"Lviv\",\n\"region\": {\n\"country\": {\n\"id\": 1,\n\"name\": \"Ukraine\"\n},\n\"country_id\": 1,\n\"id\": 1,\n\"name\": \"Lvivska oblast\"\n},\n\"region_id\": 1\n},\n\"city_id\": 1,\n\"id\": 2,\n\"name\": \"Ivana Franka\"\n},\n\"street_id\": 2\n},\n\"address_id\": 2,\n\"amount_of_money\": 0,\n\"gps_coordinates\": \"49.827311, 24.012581\",\n\"id\": 2,\n\"image_url\": \"https:\/\/images.unsplash.com\/photo-1594276922955-790ba2194e27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80\",\n\"name\": \"23\/7 Express\",\n\"trade_marks\": [\n\"Fanta\",\n\"Coca Cola\"\n]\n}\n]";
    List data = List.from(jsonDecode(testJson));
    List<VendingMachine> vendingMachineList =
        data.map((item) => VendingMachine.fromJson(item)).toList();
    return Future.delayed(Duration(seconds: 5), () => vendingMachineList);
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
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                  );
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
