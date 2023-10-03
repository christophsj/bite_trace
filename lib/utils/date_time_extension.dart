import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime atMidday() {
    final d = this;
    return DateTime(d.year, d.month, d.day, 12);
  }

  String dateForCalendar() {
    final selected = this;
    final now = DateTime.now();
    if (selected == now.atMidday()) return 'Today';
    if (selected == now.subtract(const Duration(days: 1)).atMidday()) {
      return 'Yesterday';
    }
    if (selected == now.add(const Duration(days: 1)).atMidday()) {
      return 'Tomorrow';
    }
    return DateFormat('EEE, d MMM yyyy').format(selected);
  }
}
