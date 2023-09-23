import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/screens/home/diary.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FriendsScreen extends ConsumerWidget {
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
      (final AccountStateReady s) => _userDataReady(s.data, ref)
    };
  }

  Widget _userDataReady(AccountData data, WidgetRef ref) {
    if (data.friends == null || data.friends!.isEmpty) {
      return const Center(
        child: Text('You have no friends'),
      );
    }
    final friendId = ref.watch(selectedFriendProvider);
    return Column(
      children: [
        DropdownButton(
          value: friendId,
          onChanged: (value) {
            ref.read(selectedFriendProvider.notifier).state = value;
          },
          items: data.friends!
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
        ),
        if (friendId != null)
          Expanded(
            child: FutureBuilder(
              future: ref
                  .read(accountServiceProvider)
                  .getAccount(friendId, updateState: false),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Diary(snapshot.data!);
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
      ],
    );
  }
}
