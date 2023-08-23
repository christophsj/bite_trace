import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/account_data.dart';
import 'package:bite_trace/models/nutrient_goals.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController calorieController =
      TextEditingController(text: '2500');
  final TextEditingController carbController =
      TextEditingController(text: '50');
  final TextEditingController fatController = TextEditingController(text: '25');
  final TextEditingController proteinController =
      TextEditingController(text: '25');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountService = ref.read(accountServiceProvider);
    final authService = ref.read(authServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: calorieController,
                decoration: const InputDecoration(labelText: 'Calorie Goal'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: carbController,
                decoration:
                    const InputDecoration(labelText: 'Carbohydrate Goal'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: fatController,
                decoration: const InputDecoration(labelText: 'Fat Goal'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: proteinController,
                decoration: const InputDecoration(labelText: 'Protein Goal'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final n = NutrientGoals(
                    calories: int.parse(calorieController.text),
                    carbPerc: int.parse(carbController.text),
                    fatPerc: int.parse(fatController.text),
                    proteinPerc: int.parse(proteinController.text),
                  );

                  if (!n.valid) {
                    final snackbarService = ref.read(snackbarServiceProvider);
                    snackbarService
                        .showBasic('Macro goals must add up to 100%!');
                  }

                  final data = AccountData(
                    uid: authService.getCurrentUser()!.uid,
                    username: usernameController.text,
                    nutrients: n,
                    mealNames: Constants.defaultMealNames,
                  );
                  await accountService.createAccount(data);
                  ref.read(accountDataCreationProvider.notifier).state = data;
                  ref.read(routerProvider).replace(const HomeRoute());
                },
                child: const Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
