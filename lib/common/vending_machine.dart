import 'package:flutter_async_app/common/order.dart';

class VendingMachine {
  final int id;
  final String name;
  final String address;
  final String gpsCoordinates;
  final String imageUrl;
  final double amountOfMoney;
  final List<String> tradeMarks;
  final List<Order> orders;

  VendingMachine(
      {required this.id,
      required this.name,
      required this.address,
      required this.gpsCoordinates,
      required this.imageUrl,
      required this.amountOfMoney,
      required this.tradeMarks,
      this.orders = const []});

  factory VendingMachine.fromJson(Map<String, dynamic> json) {
    return VendingMachine(
        id: json["id"],
        name: json["name"],
        address:
            "${json["address"]["street"]["city"]["region"]["country"]["name"]}, "
            "${json["address"]["street"]["city"]["region"]["name"]}, "
            "${json["address"]["street"]["city"]["name"]}, "
            "${json["address"]["street"]["name"]}, "
            "${json["address"]["building"]}",
        gpsCoordinates: json["gps_coordinates"],
        imageUrl: json["image_url"],
        amountOfMoney: json["amount_of_money"],
        tradeMarks: List.from(json["trade_marks"]),
        orders: List.from(json["orders"])
            .map((order) => Order.fromJson(order))
            .toList());
  }

  @override
  bool operator ==(Object other) => other is VendingMachine && other.id == id;

  @override
  int get hashCode => id;
}
