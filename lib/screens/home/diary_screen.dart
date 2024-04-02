import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/screens/home/diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DiaryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(authProvider);

    if (accountState.accountData == null) {
      return const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Diary(accountState.accountData!);
  }
}
