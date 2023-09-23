import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/routing/router.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/auth_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/service/food_service.dart';
import 'package:bite_trace/service/snackbar_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/theme_extension.dart';
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
    extensions: _extensions(idx),
  );
});

List<ThemeExtension> _extensions(int idx) {
  return [
    if (idx == FlexScheme.sakura.index)
      AppColorsExtension(
        carbColor: const Color(0xff919FCB),
        fatColor: const Color(0xff4F91B6),
        proteinColor: const Color(0xff006C60),
      ),
    if (idx == FlexScheme.amber.index)
      AppColorsExtension(
        carbColor: const Color(0xff00FF34),
        fatColor: const Color(0xff004CFF),
        proteinColor: const Color(0xffFF00CB),
      ),
  ];
}

final darkThemeProvider = StateProvider<ThemeData>((ref) {
  final idx = ref.watch(themeIdxProvider);
  return FlexThemeData.dark(
    scheme: FlexScheme.values[idx],
    extensions: _extensions(idx),
  );
});

final userProvider =
    FutureProvider((ref) => ref.watch(authServiceProvider).getCurrentUser());
