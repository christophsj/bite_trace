import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:bite_trace/widgets/nutrition_goals_selector.dart';
import 'package:bite_trace/widgets/segmented_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _cardHeader(context, 'Goals'),
                        NutritionGoalsDisplay(
                          goals: s.data.nutrientGoals,
                          onEdit: (x) =>
                              ref.read(accountServiceProvider).updateAccount(
                                    s.data.copyWith(nutrientGoals: x),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
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
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _cardHeader(context, 'Theme'),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: theme.colorScheme.primary),
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
                              return ThemeMode.values
                                  .map((e) => e.name)
                                  .toList()
                                  .map<Widget>((String item) {
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
                            items: ThemeMode.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.index,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Text(e.name),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: ref.read(themeModeProvider).index,
                            onChanged: (value) async {
                              if (value != null) {
                                ref.read(themeModeProvider.notifier).state =
                                    ThemeMode.values[value];
                                if (s.data.themeModeIdx != value) {
                                  ref
                                      .read(accountServiceProvider)
                                      .updateAccount(
                                        s.data.copyWith(themeModeIdx: value),
                                      );
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
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

  Widget _cardHeader(
    BuildContext context,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 8.0),
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

class StringListEditorWidget extends StatefulWidget {
  const StringListEditorWidget({
    required this.initialStrings,
    required this.onSubmit,
  });
  final List<String> initialStrings;
  final Function(List<String>) onSubmit;

  @override
  _StringListEditorWidgetState createState() => _StringListEditorWidgetState();
}

class _StringListEditorWidgetState extends State<StringListEditorWidget> {
  final List<TextEditingController> list = [];
  late final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    list.addAll(
      widget.initialStrings.map((e) => TextEditingController(text: e)),
    );
    super.initState();
  }

  void _addString() {
    setState(() {
      list.add(TextEditingController(text: 'new meal'));
    });
  }

  void _deleteString(int index) {
    final ctrl = list[index];
    setState(() {
      list.removeAt(index);
    });
    ctrl.dispose();
  }

  @override
  void dispose() {
    for (final c in list) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          for (int index = 0; index < list.length; index++)
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (String? s) {
                      if (s == null || s.isEmpty) {
                        return 'Empty text not allowed';
                      }
                      if (list
                              .where((element) => element.text == s)
                              .toList()
                              .length >
                          1) {
                        return 'Must be unique';
                      }
                      return null;
                    },
                    controller: list[index],
                    maxLength: 50,
                    decoration: const InputDecoration(counterText: ''),
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteString(index),
                ),
              ],
            ),
          const SizedBox(
            height: 16,
          ),
          TextButton.icon(
            onPressed: _addString,
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Meal',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(list.map((e) => e.text).toList());
                AutoRouter.of(context).pop();
              }
            },
            icon: const Icon(Icons.done_rounded),
            label: const Text('Submit'),
          ),
        ],
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
            onEditingComplete: () => onEditingComplete(ref),
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
                colors: const [
                  CustomColors.carbColor,
                  CustomColors.fatColor,
                  CustomColors.proteinColor,
                ],
                segmentAngles: [
                  goals.carbPerc,
                  goals.fatPerc,
                  goals.proteinPerc
                ],
                vals: const ['C', 'F', 'P'],
              ),
              for (final entry in {
                'Carbs': (goals.carbPerc, CustomColors.carbColor, 4),
                'Fats': (goals.fatPerc, CustomColors.fatColor, 9),
                'Protein': (goals.proteinPerc, CustomColors.proteinColor, 4),
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
        contentPadding: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}
