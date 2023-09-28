import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/utils/nutrient_goals_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WeeklyGoalsSelector extends ConsumerWidget {
  const WeeklyGoalsSelector({
    super.key,
    required this.nutrientGoal,
    required this.selected,
    required this.onSelect,
  });

  final NutrientGoal nutrientGoal;
  final NutrientGoalsConfig selected;
  final void Function(NutrientGoalsConfig) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...nutrientGoal.getWeeklyGoals().map(
                (e) => GestureDetector(
                  onTap: () => onSelect(e),
                  onDoubleTap: () => _openEditConfigPopup(context, e, (s) {
                    ref.read(accountServiceProvider).updateGoals(
                          nutrientGoal.copyWith(
                            weekly: [
                              ...nutrientGoal.weekly!
                                  .where((element) => element != e),
                              e.copyWith(name: s),
                            ],
                          ),
                        );
                  }, () {
                    ref.read(accountServiceProvider).updateGoals(
                          nutrientGoal.copyWith(
                            weekly: [
                              ...nutrientGoal.weekly!
                                  .where((element) => element != e),
                            ],
                          ),
                        );
                  }),
                  child: Builder(
                    builder: (context) {
                      bool hovered = false;
                      return StatefulBuilder(
                        builder: (context, setstate) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            margin: const EdgeInsets.only(bottom: 6.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: hovered
                                  ? Theme.of(context).colorScheme.outlineVariant
                                  : null,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: selected == e
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                              ),
                            ),
                            child: DragTarget<int>(
                              onWillAccept: (data) {
                                return e.days?.contains(data) != true;
                              },
                              onMove: (data) {
                                if (e.days?.contains(data.data) == true) {
                                  return;
                                }
                                setstate(
                                  () => hovered = true,
                                );
                              },
                              onLeave: (data) =>
                                  setstate(() => hovered = false),
                              onAccept: (data) {
                                if (e.days?.contains(data) == true) {
                                  return;
                                }
                                final days = <int>[...e.days ?? <int>[], data]
                                  ..sort();
                                final idx = nutrientGoal.weekly!.indexOf(e);
                                final prevIdx = nutrientGoal.weekly!.indexWhere(
                                  (element) =>
                                      element.days?.contains(data) == true,
                                );

                                nutrientGoal.weekly![prevIdx] =
                                    nutrientGoal.weekly![prevIdx].copyWith(
                                  days: nutrientGoal.weekly![prevIdx].days!
                                      .where((element) => element != data)
                                      .toList(),
                                );

                                nutrientGoal.weekly![idx] =
                                    e.copyWith(days: days);

                                ref
                                    .read(accountServiceProvider)
                                    .updateGoals(nutrientGoal);
                              },
                              builder: (
                                context,
                                candidates,
                                rejects,
                              ) =>
                                  Wrap(
                                spacing: 4.0,
                                runSpacing: 6.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Text(
                                      e.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: selected == e
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  if ((e.days ?? []).isEmpty)
                                    const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text('No Days Selected'),
                                    ),
                                  ...(e.days ?? []).map(
                                    (e) => Draggable<int>(
                                      data: e,
                                      feedback: Material(
                                        color: Colors.transparent,
                                        child: Chip(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          color: MaterialStateProperty.all(
                                            Theme.of(context).primaryColor,
                                          ),
                                          label: Text(
                                            DateFormat(
                                              DateFormat.ABBR_WEEKDAY,
                                            ).format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                1000000000,
                                              ).toUtc().add(
                                                    Duration(days: e),
                                                  ),
                                            ),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Chip(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        label: Text(
                                          DateFormat(
                                            DateFormat.ABBR_WEEKDAY,
                                          ).format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              1000000000,
                                            ).toUtc().add(Duration(days: e)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Future<void> _openEditConfigPopup(
    BuildContext context,
    NutrientGoalsConfig config,
    void Function(String) onEditName,
    void Function() onDelete,
  ) {
    return showDialog(
      context: context,
      builder: (c) {
        final text = TextEditingController(text: config.name);
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(20),
          children: [
            Text(
              'Edit day',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Theme.of(c).primaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: text,
            ),
            ElevatedButton(
              onPressed: () {
                onEditName(text.text);
                AutoRouter.of(c).pop();
              },
              child: const Text('Save'),
            ),
            IconButton(
              onPressed: () {
                onDelete();
                AutoRouter.of(c).pop();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }
}
