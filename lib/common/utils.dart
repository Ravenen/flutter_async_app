import 'package:intl/intl.dart';

String getHoursMinutesFromTimestamp(String timestamp) {
  DateTime parsed = DateTime.parse(timestamp);
  return "${parsed.hour}:${parsed.minute}";
}

String formatMoneyToUah(double value) {
  final uahFormat = NumberFormat("#,###.00", "hy-UA");
  return uahFormat.format(value) + " UAH";
}
