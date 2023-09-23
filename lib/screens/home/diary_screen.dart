import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/screens/home/diary.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DiaryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.read(accountStateProvider);
    return switch (accountState) {
      (AccountStateInitializing _) => const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      (final AccountStateError s) => ErrorView(error: s),
      (final AccountStateReady s) => Diary(s.data)
    };
  }
}
