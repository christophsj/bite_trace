import 'package:bite_trace/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DiaryCalendar extends ConsumerWidget {
  late final ScrollController scrollController = ScrollController();

  Widget _weekdayButton(
    DateTime day,
    DateTime selected,
    void Function() onSelect,
  ) {
    // ignore time when comparing
    final s = day.day == selected.day &&
        day.month == selected.month &&
        day.year == selected.year;

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
                  DateFormat('MMM').format(day),
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
    final now = DateTime.now();
    const itemExtent = 56.0;
    const futureDays = 20;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        reverse: true,
        itemCount: 1000,
        controller: ScrollController(
          initialScrollOffset: 4 +
              (itemExtent * (futureDays + 1)) -
              MediaQuery.of(context).size.width,
        ),
        itemBuilder: (context, index) {
          final e = now.subtract(Duration(days: index - futureDays));
          return _weekdayButton(e, selected, () {
            ref.read(selectedDayProvider.notifier).state = e;
            ref.read(diaryServiceProvider).getLog(e);
          });
        },
      ),
    );

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: days
    //       .map(
    //         (e) => _weekdayButton(e, selected.day, () {
    //           ref.read(selectedDayProvider.notifier).state = e;
    //           ref.read(diaryServiceProvider).getLog(e);
    //         }),
    //       )
    //       .toList(),
    // );
  }
}
