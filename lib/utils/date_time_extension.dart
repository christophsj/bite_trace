extension DateTimeExtension on DateTime {
  DateTime atMidday() {
    final d = this;
    return DateTime(d.year, d.month, d.day, 12);
  }
}
