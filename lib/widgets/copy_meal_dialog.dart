import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CopyMealDialog extends ConsumerStatefulWidget {
  const CopyMealDialog(
    this.source, {
    super.key,
    required this.fromTime,
    required this.userId,
  });

  final DateTime fromTime;
  final Meal source;
  final String userId;

  @override
  ConsumerState<CopyMealDialog> createState() => _CopyMealDialogState();
}

class _CopyMealDialogState extends ConsumerState<CopyMealDialog> {
  late DateTime selectedDate;
  late final TextEditingController ctrl;
  late Future<DiaryEntry> selectedLog;
  Meal? selectedMeal;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (now.atMidday() == widget.fromTime.atMidday()) {
      selectedDate = now.add(const Duration(days: 1));
    } else {
      selectedDate = now;
    }
    ctrl = TextEditingController(text: DateFormat.yMd().format(selectedDate));
    selectedLog =
        ref.read(diaryServiceProvider).getLog(selectedDate, uid: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Copy meal'),
      contentPadding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  final range = ref.read(dateRangeProvider);
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: range[0],
                    lastDate: range[1],
                  );

                  final uid = widget.userId;
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                      selectedMeal = null;
                      selectedLog = ref
                          .read(diaryServiceProvider)
                          .getLog(selectedDate, uid: uid);
                    });
                    ctrl.text = DateFormat.yMd().format(selectedDate);
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    controller: ctrl,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<DiaryEntry>(
                future: selectedLog,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                  }
                  final theme = Theme.of(context);
                  return DropdownButtonFormField<Meal>(
                    value: selectedMeal,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Meal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    dropdownColor: theme.brightness == Brightness.light
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    items: snapshot.data!.meals!
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: theme.brightness == Brightness.light
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        selectedMeal = v;
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedElevatedButton(
                onPressed: selectedMeal == null
                    ? null
                    : () async {
                        await ref.read(diaryServiceProvider).copyMeal(
                              await selectedLog,
                              selectedMeal!,
                              widget.source,
                            );
                        ref.read(routerProvider).maybePop();
                      },
                label: 'copy'.toUpperCase(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
