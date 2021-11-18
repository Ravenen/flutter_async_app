import 'dart:convert';

import 'package:flutter_async_app/common/constants.dart';
import 'package:flutter_async_app/common/vending_machine.dart';
import 'package:http/http.dart' as http;

class VendingMachineApi {
  static const String _baseUrl = Constants.apiUrlBase;
  static const String _path = "/vending_machine";

  static Future<List<VendingMachine>> getAll() async {
    final response = await http.get(Uri.parse("$_baseUrl$_path"));
    if (response.statusCode == 200) {
      List data = List.from(jsonDecode(response.body));
      List<VendingMachine> vendingMachineList =
          data.map((item) => VendingMachine.fromJson(item)).toList();
      return vendingMachineList;
    } else {
      throw Exception('Failed to load vending machines');
    }
  }

  static Future<VendingMachine> getById(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_path/$id"));
    if (response.statusCode == 200) {
      return VendingMachine.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load vending machines');
    }
  }
}
