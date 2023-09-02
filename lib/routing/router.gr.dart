// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:bite_trace/models/ModelProvider.dart' as _i9;
import 'package:bite_trace/screens/food_details_screen.dart' as _i3;
import 'package:bite_trace/screens/food_search_screen.dart' as _i4;
import 'package:bite_trace/screens/home/account_screen.dart' as _i1;
import 'package:bite_trace/screens/home/diary_screen.dart' as _i2;
import 'package:bite_trace/screens/home_screen.dart' as _i5;
import 'package:bite_trace/screens/meal_details_screen.dart' as _i6;
import 'package:bite_trace/screens/register_screen.dart' as _i7;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    DiaryRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DiaryScreen(),
      );
    },
    FoodDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FoodDetailsRouteArgs>();
      return _i8.AutoRoutePage<_i9.DiaryEntry?>(
        routeData: routeData,
        child: _i3.FoodDetailsScreen(
          initialMealIndex: args.initialMealIndex,
          log: args.log,
          food: args.food,
          foodIdx: args.foodIdx,
          key: args.key,
        ),
      );
    },
    FoodSearchRoute.name: (routeData) {
      final args = routeData.argsAs<FoodSearchRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FoodSearchScreen(
          log: args.log,
          initialMealIndex: args.initialMealIndex,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MealDetailsScreen(
          log: args.log,
          key: args.key,
          meal: args.meal,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DiaryScreen]
class DiaryRoute extends _i8.PageRouteInfo<void> {
  const DiaryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FoodDetailsScreen]
class FoodDetailsRoute extends _i8.PageRouteInfo<FoodDetailsRouteArgs> {
  FoodDetailsRoute({
    required int initialMealIndex,
    required _i9.DiaryEntry log,
    required _i9.Food food,
    int? foodIdx,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          FoodDetailsRoute.name,
          args: FoodDetailsRouteArgs(
            initialMealIndex: initialMealIndex,
            log: log,
            food: food,
            foodIdx: foodIdx,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodDetailsRoute';

  static const _i8.PageInfo<FoodDetailsRouteArgs> page =
      _i8.PageInfo<FoodDetailsRouteArgs>(name);
}

class FoodDetailsRouteArgs {
  const FoodDetailsRouteArgs({
    required this.initialMealIndex,
    required this.log,
    required this.food,
    this.foodIdx,
    this.key,
  });

  final int initialMealIndex;

  final _i9.DiaryEntry log;

  final _i9.Food food;

  final int? foodIdx;

  final _i10.Key? key;

  @override
  String toString() {
    return 'FoodDetailsRouteArgs{initialMealIndex: $initialMealIndex, log: $log, food: $food, foodIdx: $foodIdx, key: $key}';
  }
}

/// generated route for
/// [_i4.FoodSearchScreen]
class FoodSearchRoute extends _i8.PageRouteInfo<FoodSearchRouteArgs> {
  FoodSearchRoute({
    required _i9.DiaryEntry log,
    required int initialMealIndex,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          FoodSearchRoute.name,
          args: FoodSearchRouteArgs(
            log: log,
            initialMealIndex: initialMealIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodSearchRoute';

  static const _i8.PageInfo<FoodSearchRouteArgs> page =
      _i8.PageInfo<FoodSearchRouteArgs>(name);
}

class FoodSearchRouteArgs {
  const FoodSearchRouteArgs({
    required this.log,
    required this.initialMealIndex,
    this.key,
  });

  final _i9.DiaryEntry log;

  final int initialMealIndex;

  final _i10.Key? key;

  @override
  String toString() {
    return 'FoodSearchRouteArgs{log: $log, initialMealIndex: $initialMealIndex, key: $key}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MealDetailsScreen]
class MealDetailsRoute extends _i8.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute({
    required _i9.DiaryEntry log,
    _i10.Key? key,
    required _i9.Meal meal,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MealDetailsRoute.name,
          args: MealDetailsRouteArgs(
            log: log,
            key: key,
            meal: meal,
          ),
          initialChildren: children,
        );

  static const String name = 'MealDetailsRoute';

  static const _i8.PageInfo<MealDetailsRouteArgs> page =
      _i8.PageInfo<MealDetailsRouteArgs>(name);
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs({
    required this.log,
    this.key,
    required this.meal,
  });

  final _i9.DiaryEntry log;

  final _i10.Key? key;

  final _i9.Meal meal;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{log: $log, key: $key, meal: $meal}';
  }
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
