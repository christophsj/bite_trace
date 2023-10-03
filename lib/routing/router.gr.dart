// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:bite_trace/models/ModelProvider.dart' as _i13;
import 'package:bite_trace/screens/barcode_scan_screen.dart' as _i2;
import 'package:bite_trace/screens/food_details_screen.dart' as _i5;
import 'package:bite_trace/screens/food_search_screen.dart' as _i6;
import 'package:bite_trace/screens/friends_diary_screen.dart' as _i7;
import 'package:bite_trace/screens/home/account_screen.dart' as _i1;
import 'package:bite_trace/screens/home/diary_screen.dart' as _i3;
import 'package:bite_trace/screens/home/exercise_screen.dart' as _i4;
import 'package:bite_trace/screens/home/friends_screen.dart' as _i8;
import 'package:bite_trace/screens/home_screen.dart' as _i9;
import 'package:bite_trace/screens/meal_details_screen.dart' as _i10;
import 'package:bite_trace/screens/register_screen.dart' as _i11;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    BarcodeScanRoute.name: (routeData) {
      final args = routeData.argsAs<BarcodeScanRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarcodeScanScreen(
          log: args.log,
          selectedMealIndex: args.selectedMealIndex,
          key: args.key,
        ),
      );
    },
    DiaryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DiaryScreen(),
      );
    },
    ExerciseRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ExerciseScreen(),
      );
    },
    FoodDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FoodDetailsRouteArgs>();
      return _i12.AutoRoutePage<_i13.DiaryEntry?>(
        routeData: routeData,
        child: _i5.FoodDetailsScreen(
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
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.FoodSearchScreen(
          log: args.log,
          initialMealIndex: args.initialMealIndex,
          key: args.key,
        ),
      );
    },
    FriendsDiaryRoute.name: (routeData) {
      final args = routeData.argsAs<FriendsDiaryRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.FriendsDiaryScreen(
          args.friendId,
          key: args.key,
        ),
      );
    },
    FriendsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.FriendsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    MealDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MealDetailsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.MealDetailsScreen(
          userId: args.userId,
          log: args.log,
          key: args.key,
          meal: args.meal,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i12.PageRouteInfo<void> {
  const AccountRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BarcodeScanScreen]
class BarcodeScanRoute extends _i12.PageRouteInfo<BarcodeScanRouteArgs> {
  BarcodeScanRoute({
    required _i13.DiaryEntry log,
    required int selectedMealIndex,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          BarcodeScanRoute.name,
          args: BarcodeScanRouteArgs(
            log: log,
            selectedMealIndex: selectedMealIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BarcodeScanRoute';

  static const _i12.PageInfo<BarcodeScanRouteArgs> page =
      _i12.PageInfo<BarcodeScanRouteArgs>(name);
}

class BarcodeScanRouteArgs {
  const BarcodeScanRouteArgs({
    required this.log,
    required this.selectedMealIndex,
    this.key,
  });

  final _i13.DiaryEntry log;

  final int selectedMealIndex;

  final _i14.Key? key;

  @override
  String toString() {
    return 'BarcodeScanRouteArgs{log: $log, selectedMealIndex: $selectedMealIndex, key: $key}';
  }
}

/// generated route for
/// [_i3.DiaryScreen]
class DiaryRoute extends _i12.PageRouteInfo<void> {
  const DiaryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ExerciseScreen]
class ExerciseRoute extends _i12.PageRouteInfo<void> {
  const ExerciseRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ExerciseRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExerciseRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FoodDetailsScreen]
class FoodDetailsRoute extends _i12.PageRouteInfo<FoodDetailsRouteArgs> {
  FoodDetailsRoute({
    required int initialMealIndex,
    required _i13.DiaryEntry log,
    required _i13.Food food,
    int? foodIdx,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<FoodDetailsRouteArgs> page =
      _i12.PageInfo<FoodDetailsRouteArgs>(name);
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

  final _i13.DiaryEntry log;

  final _i13.Food food;

  final int? foodIdx;

  final _i14.Key? key;

  @override
  String toString() {
    return 'FoodDetailsRouteArgs{initialMealIndex: $initialMealIndex, log: $log, food: $food, foodIdx: $foodIdx, key: $key}';
  }
}

/// generated route for
/// [_i6.FoodSearchScreen]
class FoodSearchRoute extends _i12.PageRouteInfo<FoodSearchRouteArgs> {
  FoodSearchRoute({
    required _i13.DiaryEntry log,
    required int initialMealIndex,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<FoodSearchRouteArgs> page =
      _i12.PageInfo<FoodSearchRouteArgs>(name);
}

class FoodSearchRouteArgs {
  const FoodSearchRouteArgs({
    required this.log,
    required this.initialMealIndex,
    this.key,
  });

  final _i13.DiaryEntry log;

  final int initialMealIndex;

  final _i14.Key? key;

  @override
  String toString() {
    return 'FoodSearchRouteArgs{log: $log, initialMealIndex: $initialMealIndex, key: $key}';
  }
}

/// generated route for
/// [_i7.FriendsDiaryScreen]
class FriendsDiaryRoute extends _i12.PageRouteInfo<FriendsDiaryRouteArgs> {
  FriendsDiaryRoute({
    required String friendId,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          FriendsDiaryRoute.name,
          args: FriendsDiaryRouteArgs(
            friendId: friendId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FriendsDiaryRoute';

  static const _i12.PageInfo<FriendsDiaryRouteArgs> page =
      _i12.PageInfo<FriendsDiaryRouteArgs>(name);
}

class FriendsDiaryRouteArgs {
  const FriendsDiaryRouteArgs({
    required this.friendId,
    this.key,
  });

  final String friendId;

  final _i14.Key? key;

  @override
  String toString() {
    return 'FriendsDiaryRouteArgs{friendId: $friendId, key: $key}';
  }
}

/// generated route for
/// [_i8.FriendsScreen]
class FriendsRoute extends _i12.PageRouteInfo<void> {
  const FriendsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          FriendsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MealDetailsScreen]
class MealDetailsRoute extends _i12.PageRouteInfo<MealDetailsRouteArgs> {
  MealDetailsRoute({
    required String userId,
    required _i13.DiaryEntry log,
    _i14.Key? key,
    required _i13.Meal meal,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MealDetailsRoute.name,
          args: MealDetailsRouteArgs(
            userId: userId,
            log: log,
            key: key,
            meal: meal,
          ),
          initialChildren: children,
        );

  static const String name = 'MealDetailsRoute';

  static const _i12.PageInfo<MealDetailsRouteArgs> page =
      _i12.PageInfo<MealDetailsRouteArgs>(name);
}

class MealDetailsRouteArgs {
  const MealDetailsRouteArgs({
    required this.userId,
    required this.log,
    this.key,
    required this.meal,
  });

  final String userId;

  final _i13.DiaryEntry log;

  final _i14.Key? key;

  final _i13.Meal meal;

  @override
  String toString() {
    return 'MealDetailsRouteArgs{userId: $userId, log: $log, key: $key, meal: $meal}';
  }
}

/// generated route for
/// [_i11.RegisterScreen]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
