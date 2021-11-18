String getHoursMinutesFromTimestamp(String timestamp) {
  DateTime parsed = DateTime.parse(timestamp);
  return "${parsed.hour}:${parsed.minute}";
}