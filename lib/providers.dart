import 'package:bite_trace/app_colors_extension.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/routing/router.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/auth_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/service/food_service.dart';
import 'package:bite_trace/service/home_widget_service.dart';
import 'package:bite_trace/service/open_food_service.dart';
import 'package:bite_trace/service/snackbar_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<AppRouter>((ref) => AppRouter());

final authServiceProvider =
    Provider<AuthService>((ref) => AuthService(ref: ref));

final accountServiceProvider =
    Provider<AccountService>((ref) => AccountService(ref: ref));

final diaryServiceProvider =
    Provider<DiaryService>((ref) => DiaryService(ref: ref));

final snackbarServiceProvider =
    Provider<SnackbarService>((ref) => SnackbarService());

final foodSearchProvider =
    Provider<FitnessPalFoodService>((ref) => FitnessPalFoodService(ref: ref));

final openFoodServiceProvider =
    Provider<OpenFoodService>((ref) => OpenFoodService(ref: ref));

final homeWidgetServiceProvider =
    Provider<HomeWidgetService>((ref) => HomeWidgetService(ref: ref));

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now().atMidday();
});

final accountDataProvider = FutureProvider<AccountData?>((ref) async {
  final user = await ref.watch(authServiceProvider).getCurrentUser();
  if (user == null) {
    return null;
  }
  return ref.watch(accountServiceProvider).getAccount(user.userId);
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final s = ref.watch(accountStateProvider);
  final int? idx = switch (s) {
    (final AccountStateReady r) => r.data.themeModeIdx,
    (AccountStateInitializing _) => null,
    (AccountStateError _) => null
  };
  return ThemeMode.values[idx ?? ThemeMode.system.index];
});

final themeIdxProvider = StateProvider<int>((ref) {
  final s = ref.watch(accountStateProvider);
  final int? idx = switch (s) {
    (final AccountStateReady r) => r.data.themeColorIdx,
    (AccountStateInitializing _) => null,
    (AccountStateError _) => null
  };
  return idx ?? 0;
});

final lightThemeProvider = StateProvider<ThemeData>((ref) {
  final idx = ref.watch(themeIdxProvider);
  return FlexThemeData.light(
    scheme: FlexScheme.values[idx],
    extensions: FlexScheme.values[idx].ext(),
  );
});

final darkThemeProvider = StateProvider<ThemeData>((ref) {
  final idx = ref.watch(themeIdxProvider);
  return FlexThemeData.dark(
    scheme: FlexScheme.values[idx],
    extensions: FlexScheme.values[idx].ext(),
  );
});

final userProvider =
    FutureProvider((ref) => ref.watch(authServiceProvider).getCurrentUser());

final selectedFriendProvider = StateProvider<String?>((ref) {
  return null;
});
