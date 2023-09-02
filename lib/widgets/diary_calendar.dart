import 'package:bite_trace/providers.dart';
import 'package:bite_trace/screens/home/diary_screen.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DiaryCalendar extends ConsumerWidget {
  String _formatDay(DateTime date) {
    return DateFormat('d').format(date);
  }

  Widget _weekdayButton(
    DateTime day,
    DateTime selected,
    void Function() onSelect,
  ) {
    // ignore time when comparing
    final s = day.atMidday() == selected;

    return Builder(
      builder: (context) {
        final now = DateTime.now();
        final today = day.day == now.day &&
            day.month == now.month &&
            day.year == now.year;
        final buttonLabel = _formatDay(day);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: !today
                  ? null
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
              child: ElevatedButton(
                onPressed: onSelect,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor:
                      s ? null : Theme.of(context).colorScheme.onPrimary,
                  foregroundColor:
                      s ? null : Theme.of(context).colorScheme.secondary,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: const Size(50, 50),
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonLabel,
                        style: TextStyle(
                          fontSize: int.tryParse(buttonLabel) != null ? 16 : 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              DateFormat('EEE').format(day),
              style: TextStyle(
                color: s
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDayProvider);
    final now = DateTime.now().atMidday();
    const itemExtent = 56.0;
    const futureDays = 10;
    const itemCount = 1000;
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                DateFormat('EEE, d MMMM yyyy').format(selected),
              ),
              const Spacer(),
              if (selected != now)
                TextButton(
                  onPressed: () {
                    ref.read(selectedDayProvider.notifier).state = now;
                  },
                  child: const Text('today'),
                ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.today)),
            ],
          ),
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: itemExtent,
            reverse: true,
            shrinkWrap: true,
            itemCount: itemCount,
            controller: ScrollController(
              initialScrollOffset: (itemExtent *
                      (futureDays +
                          (now.difference(selected.atMidday()).inDays))) -
                  (w / 2) +
                  (itemExtent / 2),
            ),
            itemBuilder: (context, index) {
              final e = DiaryScreen.idxToDate(index);
              return _weekdayButton(e, selected, () {
                ref.read(selectedDayProvider.notifier).state = e;
              });
            },
          ),
        ),
      ],
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
