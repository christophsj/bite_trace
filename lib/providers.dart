import 'package:bite_trace/models/account_data.dart';
import 'package:bite_trace/routing/router.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/auth_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/service/food_service.dart';
import 'package:bite_trace/service/snackbar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final foodServiceProvider =
    Provider<FitnessPalFoodService>((ref) => FitnessPalFoodService(ref: ref));

final accountDataCreationProvider = StateProvider<AccountData?>((ref) {
  return null;
});

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final accountDataProvider = FutureProvider<AccountData?>((ref) async {
  final created = ref.watch(accountDataCreationProvider);
  if (created != null) {
    return created;
  }
  final user = await ref.watch(authStateChangesProvider.future);
  if (user == null) {
    return null;
  }
  return ref.watch(accountServiceProvider).getAccount(user.uid);
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});
