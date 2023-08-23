// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:bite_trace/models/daily_log.dart' as _i11;
import 'package:bite_trace/models/food.dart' as _i10;
import 'package:bite_trace/models/meal.dart' as _i13;
import 'package:bite_trace/screens/food_details_screen.dart' as _i3;
import 'package:bite_trace/screens/food_search_screen.dart' as _i4;
import 'package:bite_trace/screens/home/account_screen.dart' as _i1;
import 'package:bite_trace/screens/home/diary_screen.dart' as _i2;
import 'package:bite_trace/screens/home_screen.dart' as _i5;
import 'package:bite_trace/screens/login_screen.dart' as _i6;
import 'package:bite_trace/screens/meal_details_screen.dart' as _i7;
import 'package:bite_trace/screens/register_screen.dart' as _i8;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    DiaryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DiaryScreen(),
      );
    },
    FoodDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FoodDetailsRouteArgs>();
      return _i9.AutoRoutePage<_i10.Food?>(
        routeData: routeData,
        child: _i3.FoodDetailsScreen(
          initialMealIndex: args.initialMealIndex,
          log: args.log,
          food: args.food,
          key: args.key,
        ),
      );
    },
    FoodSearchRoute.name: (routeData) {
      final args = routeData.argsAs<FoodSearchRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FoodSearchScreen(
          log: args.log,
          initialMealIndex: args.initialMealIndex,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginScreen(key: args.key),
      );
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MealDetailsScreen(
          log: args.log,
          key: args.key,
          meal: args.meal,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RegisterScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DiaryScreen]
class DiaryRoute extends _i9.PageRouteInfo<void> {
  const DiaryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FoodDetailsScreen]
class FoodDetailsRoute extends _i9.PageRouteInfo<FoodDetailsRouteArgs> {
  FoodDetailsRoute({
    required int initialMealIndex,
    required _i11.DailyLog log,
    required _i10.Food food,
    _i12.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          FoodDetailsRoute.name,
          args: FoodDetailsRouteArgs(
            initialMealIndex: initialMealIndex,
            log: log,
            food: food,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodDetailsRoute';

  static const _i9.PageInfo<FoodDetailsRouteArgs> page =
      _i9.PageInfo<FoodDetailsRouteArgs>(name);
}

class FoodDetailsRouteArgs {
  const FoodDetailsRouteArgs({
    required this.initialMealIndex,
    required this.log,
    required this.food,
    this.key,
  });

  final int initialMealIndex;

  final _i11.DailyLog log;

  final _i10.Food food;

  final _i12.Key? key;

  @override
  String toString() {
    return 'FoodDetailsRouteArgs{initialMealIndex: $initialMealIndex, log: $log, food: $food, key: $key}';
  }
}

/// generated route for
/// [_i4.FoodSearchScreen]
class FoodSearchRoute extends _i9.PageRouteInfo<FoodSearchRouteArgs> {
  FoodSearchRoute({
    required _i11.DailyLog log,
    required int initialMealIndex,
    _i12.Key? key,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<FoodSearchRouteArgs> page =
      _i9.PageInfo<FoodSearchRouteArgs>(name);
}

class FoodSearchRouteArgs {
  const FoodSearchRouteArgs({
    required this.log,
    required this.initialMealIndex,
    this.key,
  });

  final _i11.DailyLog log;

  final int initialMealIndex;

  final _i12.Key? key;

  @override
  String toString() {
    return 'FoodSearchRouteArgs{log: $log, initialMealIndex: $initialMealIndex, key: $key}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i12.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<LoginRouteArgs> page =
      _i9.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.MealDetailsScreen]
class MealDetailsRoute extends _i9.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute({
    required _i11.DailyLog log,
    _i12.Key? key,
    required _i13.Meal meal,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<MealDetailsRouteArgs> page =
      _i9.PageInfo<MealDetailsRouteArgs>(name);
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs({
    required this.log,
    this.key,
    required this.meal,
  });

  final _i11.DailyLog log;

  final _i12.Key? key;

  final _i13.Meal meal;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{log: $log, key: $key, meal: $meal}';
  }
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i12.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<RegisterRouteArgs> page =
      _i9.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
