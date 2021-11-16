import 'package:flutter/material.dart';
import 'package:flutter_async_app/common/orders_placed_bloc.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machines_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
    create: (_) => OrdersPlacedBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vending Machines App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const VendingMachinesPage(),
    );
  }
}
