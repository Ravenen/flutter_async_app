import 'package:flutter/material.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machines_page.dart';

void main() {
  runApp(const MyApp());
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
