import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/models/NutrientGoals.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController calorieController =
      TextEditingController(text: '2500');
  final TextEditingController carbController =
      TextEditingController(text: '50');
  final TextEditingController fatController = TextEditingController(text: '25');
  final TextEditingController proteinController =
      TextEditingController(text: '25');

  int sum = 100;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    carbController.addListener(listen);
    fatController.addListener(listen);
    proteinController.addListener(listen);
    super.initState();
  }

  void listen() {
    setState(() {
      sum = (int.tryParse(carbController.text) ?? 0) +
          (int.tryParse(fatController.text) ?? 0) +
          (int.tryParse(proteinController.text) ?? 0);
    });
  }

  String? calorieValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    if (int.tryParse(value) == null) {
      return 'Only integer numbers are valid!';
    }
    return null;
  }

  String? macroValidator(String? value) {
    final calorieError = calorieValidator(value);
    if (calorieError != null) {
      return calorieError;
    }
    final val = int.tryParse(value!)!;
    if (val < 1 || val > 99) {
      return 'Value must be 0 < x < 100';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final accountService = ref.read(accountServiceProvider);
    final authService = ref.read(authServiceProvider);

    final validMacros = sum == 100;
    final color =
        validMacros ? Theme.of(context).colorScheme.onBackground : Colors.red;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/logo.png'),
                const SizedBox(height: 10),
                TextFormField(
                  validator: calorieValidator,
                  controller: calorieController,
                  decoration: const InputDecoration(labelText: 'Calorie Goal'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: macroValidator,
                  controller: carbController,
                  decoration:
                      const InputDecoration(labelText: 'Carbohydrate Goal'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: macroValidator,
                  controller: fatController,
                  decoration: const InputDecoration(labelText: 'Fat Goal'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: proteinController,
                  validator: macroValidator,
                  decoration: const InputDecoration(labelText: 'Protein Goal'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        'Macros sum to',
                        style: TextStyle(color: color),
                      ),
                      const Spacer(),
                      Text(
                        '$sum',
                        style: TextStyle(color: color),
                      ),
                      if (validMacros)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        )
                      else
                        Icon(
                          Icons.error_outline,
                          color: color,
                          size: 20,
                        )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: !validMacros
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            final n = NutrientGoals(
                              calories: int.parse(calorieController.text),
                              carbPerc: int.parse(carbController.text),
                              fatPerc: int.parse(fatController.text),
                              proteinPerc: int.parse(proteinController.text),
                            );

                            final data = AccountData(
                              id: (await authService.getCurrentUser())!.userId,
                              nutrientGoals: n,
                              mealNames: Constants.defaultMealNames,
                            );
                            await accountService.createAccount(data);
                            ref
                                .read(accountDataCreationProvider.notifier)
                                .state = data;
                            ref.read(routerProvider).replace(const HomeRoute());
                          }
                        },
                  child: const Text('Finish'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
