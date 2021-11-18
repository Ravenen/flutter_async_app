class Order {
  final int id;
  final String tradeMark;
  final String productName;
  final double price;
  final String timestamp;

  const Order(
      {required this.id,
      required this.tradeMark,
      required this.productName,
      required this.price,
      required this.timestamp});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json["id"],
        tradeMark: json["menu_item"]["product"]["trade_mark"]["name"],
        productName: json["menu_item"]["product"]["name"],
        price: json["menu_item"]["price"],
        timestamp: json["order_time"]);
  }
}
