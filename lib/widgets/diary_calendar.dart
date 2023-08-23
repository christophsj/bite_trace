import 'package:bite_trace/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DiaryCalendar extends ConsumerWidget {
  late final ScrollController scrollController = ScrollController();
  late final List<DateTime> days = _generateDateList();

  static List<DateTime> _generateDateList() {
    final DateTime today = DateTime.now();
    final List<DateTime> dateList = [];

    // Previous 3 days
    for (int i = 3; i > 0; i--) {
      dateList.add(today.subtract(Duration(days: i)));
    }

    // Current day
    dateList.add(today);

    // Next 3 days
    for (int i = 1; i <= 3; i++) {
      dateList.add(today.add(Duration(days: i)));
    }

    return dateList;
  }

  Widget _weekdayButton(DateTime day, int selected, void Function() onSelect) {
    final s = day.day == selected;

    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: onSelect,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor:
                  s ? null : Theme.of(context).colorScheme.onPrimary,
              foregroundColor:
                  s ? null : Theme.of(context).colorScheme.secondary,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day.day.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  DateFormat('EEE').format(day),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDayProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days
          .map(
            (e) => _weekdayButton(e, selected.day, () {
              ref.read(selectedDayProvider.notifier).state = e;
            }),
          )
          .toList(),
    );
  }
}
