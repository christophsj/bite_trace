import 'package:bite_trace/models/Meal.dart';
import 'package:flutter/material.dart';

class AppBarWithMealSelector extends AppBar {
  AppBarWithMealSelector({
    super.key,
    required void Function(int?) onChanged,
    required int selectedMealIndex,
    required List<Meal> meals,
  }) : super(
          title: Builder(
            builder: (context) => DropdownButton(
              iconEnabledColor: Theme.of(context).colorScheme.onPrimary,
              dropdownColor: Theme.of(context).colorScheme.primary,
              underline: Container(),
              value: selectedMealIndex,
              items: meals
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.index,
                      child: Text(
                        e.name,
                        style: getStyle(context),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        );
  static TextStyle getStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
