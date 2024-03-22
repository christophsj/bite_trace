import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/app_colors_extension.dart';
import 'package:bite_trace/routing/router.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/auth_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/service/food_service.dart';
import 'package:bite_trace/service/home_widget_service.dart';
import 'package:bite_trace/service/open_food_service.dart';
import 'package:bite_trace/service/snackbar_service.dart';
import 'package:bite_trace/state/auth_state.dart';
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

final authProvider = StateNotifierProvider<AuthService, AuthState>((ref) {
  final s = ref.watch(authServiceProvider);
  return s;
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final s = ref.watch(authProvider);

  if (s.accountData?.themeModeIdx != null) {
    return ThemeMode.values[s.accountData!.themeModeIdx!];
  }

  return ThemeMode.dark;
});

final themeIdxProvider = StateProvider<int>((ref) {
  final s = ref.watch(authProvider);
  final int? idx = s.accountData?.themeColorIdx;
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

final selectedFriendProvider = StateProvider<String?>((ref) {
  return null;
});

final dateRangeProvider = StateProvider<List<DateTime>>((ref) {
  final state = ref.watch(authProvider);
  if (state.accountData == null) {
    return [DateTime.now().atMidday(), DateTime.now().atMidday()];
  }

  DateTime from = (state.accountData!.createdAt ?? TemporalDateTime.now())
      .getDateTimeInUtc()
      .toLocal()
      .atMidday();
  if (state.accountData!.createdAt == null) {
    // if for some reason created at is not availabe, make last 14 days available
    from = from.subtract(const Duration(days: 14));
  }
  final to = DateTime.now().atMidday();
  return [from, to];
});
