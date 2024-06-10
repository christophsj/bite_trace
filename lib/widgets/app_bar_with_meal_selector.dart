import 'package:bite_trace/models/Meal.dart';
import 'package:flutter/material.dart';

class AppBarWithMealSelector extends SliverAppBar {
  AppBarWithMealSelector({
    super.key,
    required void Function(int?) onChanged,
    required int selectedMealIndex,
    required List<Meal> meals,
    super.flexibleSpace,
    required TickerProvider provider,
  }) : super(
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: 120,
          collapsedHeight: 100,
          bottom: TabBar.secondary(
            controller: TabController(length: 2, vsync: provider),
            tabs: ['1', '2']
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          ),
          title: Builder(
            builder: (context) {
              final theme = Theme.of(context);
              return DropdownButton(
                dropdownColor: theme.brightness == Brightness.light
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surface,
                underline: Container(),
                value: selectedMealIndex,
                items: meals
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.index,
                        child: Text(
                          e.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: theme.brightness == Brightness.light
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              );
            },
          ),
        );
}
