class VendingMachine {
  final int id;
  final String name;
  final String address;
  final String gpsCoordinates;
  final String imageUrl;
  final int amountOfMoney;
  final List<String> tradeMarks;

  const VendingMachine(this.id, this.name, this.address, this.gpsCoordinates,
      this.imageUrl, this.amountOfMoney, this.tradeMarks);

  @override
  bool operator ==(Object other) => other is VendingMachine && other.id == id;

  @override
  int get hashCode => id;
}
