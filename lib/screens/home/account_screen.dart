import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    final accountData = ref.watch(accountDataProvider);

    return accountData.when(
      data: (data) {
        data = data!;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Account'),
              Text(data.uid),
              Text(data.username),
              Text(data.nutrients.toString()),
              ElevatedButton(
                onPressed: authService.signOut,
                child: Text('logout'.toUpperCase()),
              )
            ],
          ),
        );
      },
      error: (error, _) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
