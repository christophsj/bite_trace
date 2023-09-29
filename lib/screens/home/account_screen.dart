import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/app_colors_extension.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/utils/context_extension.dart';
import 'package:bite_trace/utils/nutrient_goals_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:bite_trace/widgets/nutrition_goals_selector.dart';
import 'package:bite_trace/widgets/segmented_circle.dart';
import 'package:bite_trace/widgets/string_list_editor_widget.dart';
import 'package:bite_trace/widgets/weekly_goals_selector.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    final accountState = ref.watch(accountStateProvider);

    final theme = Theme.of(context);

    return switch (accountState) {
      (AccountStateInitializing _) => const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      (final AccountStateError s) => ErrorView(error: s),
      (final AccountStateReady s) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        NutrientGoalsConfig selected =
                            s.data.nutrientGoal!.getWeeklyGoals().firstWhere(
                                  (element) => (element.days ?? [])
                                      .contains(DateTime.now().weekday - 1),
                                );
                        return StatefulBuilder(
                          builder: (context, setstate) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    _cardHeader(context, 'Goals'),
                                    const Spacer(),
                                    if (!s.data.nutrientGoal!.isDailyGoal())
                                      _buildAddButton(ref, s, context),
                                    const Text('More Routines'),
                                    _buildSwitch(context, s, ref),
                                  ],
                                ),
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 300),
                                  child: Builder(
                                    builder: (context) {
                                      if (s.data.nutrientGoal!.isDailyGoal()) {
                                        return Container();
                                      }
                                      return WeeklyGoalsSelector(
                                        nutrientGoal: s.data.nutrientGoal!,
                                        selected: selected,
                                        onSelect: (p0) {
                                          setstate(() {
                                            selected = p0;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(height: 16),
                                NutritionGoalsDisplay(
                                  goals: s.data.nutrientGoal!.isDailyGoal()
                                      ? s.data.nutrientGoal!.daily!
                                      : selected.goals,
                                  onEdit: (newGoals) {
                                    AccountData accountData;
                                    if (s.data.nutrientGoal!.isDailyGoal()) {
                                      accountData = s.data.copyWith(
                                        nutrientGoal:
                                            s.data.nutrientGoal!.copyWith(
                                          setAt: TemporalDate.now(),
                                          daily: newGoals,
                                        ),
                                      );
                                    } else {
                                      final weeklyGoals =
                                          s.data.nutrientGoal!.getWeeklyGoals();
                                      final idx = weeklyGoals.indexOf(selected);
                                      weeklyGoals[idx] =
                                          selected.copyWith(goals: newGoals);
                                      accountData = s.data.copyWith(
                                        nutrientGoal:
                                            s.data.nutrientGoal!.copyWith(
                                          setAt: TemporalDate.now(),
                                          weekly: weeklyGoals,
                                        ),
                                      );
                                    }
                                    ref
                                        .read(accountServiceProvider)
                                        .updateAccount(accountData);
                                    ref
                                        .read(diaryServiceProvider)
                                        .updateTodaysGoals(s.data.id, newGoals);

                                    ref
                                        .read(snackbarServiceProvider)
                                        .showBasic('Updated goals');
                                  },
                                ),
                                // AnimatedSize(
                                //   duration: const Duration(milliseconds: 300),
                                //   child: Builder(
                                //     builder: (context) {
                                //       if (s.data.nutrientGoal!.isDailyGoal()) {
                                //         return Container();
                                //       }
                                //       final theme = Theme.of(context);
                                //       final monday =
                                //           DateTime.fromMillisecondsSinceEpoch(
                                //         1000000000,
                                //       ).toUtc();
                                //       return Padding(
                                //         padding: const EdgeInsets.symmetric(
                                //           vertical: 8.0,
                                //         ),
                                //         child: Row(
                                //           children: [
                                //             for (int i = 0; i < 7; i++)
                                //               Expanded(
                                //                 child: ConstrainedBox(
                                //                   constraints:
                                //                       const BoxConstraints(
                                //                     minHeight: 40,
                                //                   ),
                                //                   child: Material(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                       2.0,
                                //                     ),
                                //                     color: selected == i
                                //                         ? theme
                                //                             .colorScheme.primary
                                //                         : theme.colorScheme
                                //                             .secondary,
                                //                     child: InkWell(
                                //                       onTap: () {
                                //                         setstate(
                                //                           () {
                                //                             selected = i;
                                //                           },
                                //                         );
                                //                       },
                                //                       child: Center(
                                //                         child: Text(
                                //                           DateFormat(
                                //                             DateFormat
                                //                                 .ABBR_WEEKDAY,
                                //                           ).format(
                                //                             monday.add(
                                //                               Duration(days: i),
                                //                             ),
                                //                           ),
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                                 selected == i
                                //                                     ? FontWeight
                                //                                         .bold
                                //                                     : FontWeight
                                //                                         .normal,
                                //                             color: Theme.of(
                                //                               context,
                                //                             )
                                //                                 .colorScheme
                                //                                 .onPrimary,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //           ],
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        final meals =
                            s.data.mealNames ?? Constants.defaultMealNames;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _cardHeader(context, 'Meals'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (final m in meals)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          m,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (c) => SimpleDialog(
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        children: [
                                          _cardHeader(c, 'Edit Meals'),
                                          StringListEditorWidget(
                                            initialStrings: meals,
                                            onSubmit: (meals) async {
                                              if (meals.any(
                                                (element) => element.isEmpty,
                                              )) {
                                                ref
                                                    .read(
                                                      snackbarServiceProvider,
                                                    )
                                                    .showBasic(
                                                      'Cannot have empty text',
                                                    );
                                                return;
                                              }

                                              ref
                                                  .read(
                                                    accountServiceProvider,
                                                  )
                                                  .updateAccount(
                                                    s.data.copyWith(
                                                      mealNames: meals,
                                                    ),
                                                  );
                                            },
                                          ),
                                          Builder(
                                            builder: (ctxt) {
                                              final w =
                                                  MediaQuery.of(c).size.width;
                                              return SizedBox(
                                                width: w,
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              AutoRouter.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _cardHeader(context, 'Theme'),
                        _buildDropdownForEnum(
                          values: ThemeMode.values,
                          theme: theme,
                          value: ref.read(themeModeProvider),
                          onChanged: (value) async {
                            if (value != null) {
                              ref.read(themeModeProvider.notifier).state =
                                  ThemeMode.values[value];
                              if (s.data.themeModeIdx != value) {
                                ref.read(accountServiceProvider).updateAccount(
                                      s.data.copyWith(themeModeIdx: value),
                                    );
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildDropdownForEnum(
                          values: FlexScheme.values,
                          theme: theme,
                          value: FlexScheme.values[ref.read(themeIdxProvider)],
                          colors: (FlexScheme e) {
                            final exts = e.ext();
                            final addColors = <Color>[];
                            if (exts.isNotEmpty &&
                                exts[0] is AppColorsExtension) {
                              final x = exts[0] as AppColorsExtension;
                              addColors.add(x.carbColor);
                              addColors.add(x.fatColor);
                              addColors.add(x.proteinColor);
                            }
                            return [
                              FlexThemeData.dark(scheme: e).primaryColor,
                              FlexThemeData.dark(scheme: e)
                                  .colorScheme
                                  .secondary,
                              ...addColors,
                            ];
                          },
                          onChanged: (value) async {
                            if (value != null) {
                              ref.read(themeIdxProvider.notifier).state = value;
                              ref.read(accountServiceProvider).updateAccount(
                                    s.data.copyWith(themeColorIdx: value),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedElevatedButton(
                      onPressed: authService.signOut,
                      icon: const Icon(Icons.logout),
                      label: 'logout'.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    };
  }

  IconButton _buildAddButton(
    WidgetRef ref,
    AccountStateReady s,
    BuildContext context,
  ) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {
        ref.read(accountServiceProvider).updateGoals(
              s.data.nutrientGoal!.copyWith(
                weekly: [
                  ...s.data.nutrientGoal!.weekly ?? [],
                  NutrientGoalsConfig(
                    goals: s.data.nutrientGoal!.daily!,
                    name: 'New Goal',
                    days: [],
                  ),
                ],
              ),
            );
      },
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      icon: Icon(
        Icons.add,
        size: 22,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget _buildSwitch(
    BuildContext context,
    AccountStateReady s,
    WidgetRef ref,
  ) {
    return Switch(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: !s.data.nutrientGoal!.isDailyGoal(),
      onChanged: (isWeekly) {
        AccountData newData = s.data.copyWith(
          nutrientGoal: s.data.nutrientGoal!.copyWith(
            setAt: TemporalDate.now(),
            isDaily: !isWeekly,
          ),
        );
        if (isWeekly) {
          newData = newData.copyWith(
            nutrientGoal: newData.nutrientGoal!.copyWith(
              weekly: s.data.nutrientGoal!.getWeeklyGoals(),
            ),
          );
        }
        ref.read(accountServiceProvider).updateAccount(newData);
      },
    );
  }

  Widget _buildDropdownForEnum<T extends Enum>({
    required ThemeData theme,
    required List<T> values,
    required Enum value,
    required void Function(int?) onChanged,
    List<Color> Function(T)? colors,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<int>(
        style: TextStyle(
          color: theme.primaryColor,
          fontSize: 16.0,
        ),
        iconEnabledColor: theme.colorScheme.primary,
        underline: Container(),
        dropdownColor: theme.colorScheme.background,
        selectedItemBuilder: (BuildContext context) {
          return values.map((e) => e.name).map<Widget>((String item) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList();
        },
        isExpanded: true,
        items: values
            .map(
              (e) => DropdownMenuItem(
                value: e.index,
                child: Builder(
                  builder: (context) {
                    return SizedBox(
                      width: colors == null
                          ? null
                          : MediaQuery.of(context).size.width,
                      height: colors == null
                          ? null
                          : MediaQuery.of(context).size.height,
                      child: Row(
                        children: [
                          if (colors != null)
                            Container(
                              width: 40,
                              color: colors(e)[1],
                            ),
                          if (colors != null && colors(e).length > 4) ...[
                            Container(
                              width: 20,
                              color: colors(e)[2],
                            ),
                            Container(
                              width: 20,
                              color: colors(e)[3],
                            ),
                            Container(
                              width: 20,
                              color: colors(e)[4],
                            ),
                          ],
                          Expanded(
                            child: Container(
                              alignment:
                                  colors == null ? null : Alignment.center,
                              color: colors == null ? null : colors(e)[0],
                              child: Text(
                                e.name,
                                style: colors == null
                                    ? null
                                    : TextStyle(
                                        color: theme.colorScheme.onSecondary,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
            .toList(),
        value: value.index,
        onChanged: onChanged,
      ),
    );
  }

  Widget _cardHeader(
    BuildContext context,
    String text, {
    double bottomPadding = 10,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding, top: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class NutritionGoalsDisplay extends ConsumerWidget {
  NutritionGoalsDisplay({
    super.key,
    required this.goals,
    required this.onEdit,
  }) : ctrl = TextEditingController(text: goals.calories.toString());
  final Function(NutrientGoals) onEdit;
  final NutrientGoals goals;

  final TextEditingController ctrl;

  void onEditingComplete(WidgetRef ref) {
    final String value = ctrl.text;
    if (value == goals.calories.toString()) {
      return;
    }
    final int? cals = int.tryParse(value);
    if (cals == null) {
      ref.read(snackbarServiceProvider).showBasic('Calories must be a number');
      ctrl.text = goals.calories.toString();
      return;
    }
    if (cals > 20000) {
      ref.read(snackbarServiceProvider).showBasic(
            'Are you crazy? You cant possibly eat this much...Try below 20.000 for a start.',
          );
      ctrl.text = goals.calories.toString();
      return;
    }
    onEdit(goals.copyWith(calories: cals));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          onFocusChange: (value) {
            if (!value) {
              onEditingComplete(ref);
            }
          },
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Calories',
            ),
            controller: ctrl,
            keyboardType: TextInputType.number,
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SegmentedCircle(
                colors: [
                  context.appColors.carbColor,
                  context.appColors.fatColor,
                  context.appColors.proteinColor,
                ],
                segmentAngles: [
                  goals.carbPerc,
                  goals.fatPerc,
                  goals.proteinPerc,
                ],
                vals: const ['C', 'F', 'P'],
              ),
              for (final entry in {
                'Carbs': (goals.carbPerc, context.appColors.carbColor, 4),
                'Fats': (goals.fatPerc, context.appColors.fatColor, 9),
                'Protein': (
                  goals.proteinPerc,
                  context.appColors.proteinColor,
                  4
                ),
              }.entries)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        color: entry.value.$2,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${entry.value.$1}%',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${goals.calories * entry.value.$1 / entry.value.$3 ~/ 100}g',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              IconButton(
                onPressed: () => openEditMacrosPopup(context, goals, onEdit),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  void openEditMacrosPopup(
    BuildContext context,
    NutrientGoals g,
    Function(NutrientGoals) onSubmit,
  ) {
    showDialog(
      context: context,
      builder: (c) => SimpleDialog(
        insetPadding: const EdgeInsets.all(10.0),
        contentPadding: const EdgeInsets.all(10),
        title: const Text('Macro goals'),
        children: [
          Builder(
            builder: (context) {
              final w = MediaQuery.of(context).size.width;
              return SizedBox(
                width: w,
                child: NutritionGoalsSelector(
                  nutrientGoals: g,
                  onSubmit: (x) async {
                    onSubmit(x);
                    AutoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
