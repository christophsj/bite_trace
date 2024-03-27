import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveMealDialog extends ConsumerStatefulWidget {
  const SaveMealDialog(
    this.source, {
    super.key,
    required this.userId,
  });

  final Meal source;
  final String userId;

  @override
  ConsumerState<SaveMealDialog> createState() => _SaveMealDialogState();
}

class _SaveMealDialogState extends ConsumerState<SaveMealDialog> {
  final TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Save meal'),
      contentPadding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Save as name...',
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  border: const OutlineInputBorder(),
                ),
                controller: ctrl,
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedElevatedButton(
                onPressed: () async {
                  await ref
                      .read(mealServiceProvider)
                      .addMeal(ctrl.text, widget.source.foods);
                  ref.read(routerProvider).maybePop();
                },
                label: 'save'.toUpperCase(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
