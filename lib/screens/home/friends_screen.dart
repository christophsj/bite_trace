import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FriendsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(authProvider).accountData;

    if (data == null) {
      return const CircularProgressIndicator();
    }

    if (data.friends == null || data.friends!.isEmpty) {
      return const Center(
        child: Text('You have no friends'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 40,
        ),
        FutureBuilder(
          future: Future.wait(
            data.friends!
                .map(
                  (e) => ref.read(accountServiceProvider).getAccount(e),
                )
                .toList(),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final friend in snapshot.data!)
                        if (friend != null)
                          AnimatedElevatedButton(
                            label: friend.name,
                            showCheckmark: false,
                            onPressed: () async {
                              ref.read(selectedFriendProvider.notifier).state =
                                  friend.id;
                              await context.pushRoute(
                                FriendsDiaryRoute(friendId: friend.id),
                              );
                              ref.read(selectedFriendProvider.notifier).state =
                                  null;
                            },
                          ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) return Text(snapshot.error.toString());
            return const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
