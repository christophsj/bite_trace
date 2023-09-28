import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringListEditorWidget extends StatefulWidget {
  const StringListEditorWidget({
    required this.initialStrings,
    required this.onSubmit,
  });
  final List<String> initialStrings;
  final Function(List<String>) onSubmit;

  @override
  _StringListEditorWidgetState createState() => _StringListEditorWidgetState();
}

class _StringListEditorWidgetState extends State<StringListEditorWidget> {
  final List<TextEditingController> list = [];
  late final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    list.addAll(
      widget.initialStrings.map((e) => TextEditingController(text: e)),
    );
    super.initState();
  }

  void _addString() {
    setState(() {
      list.add(TextEditingController(text: 'new meal'));
    });
  }

  void _deleteString(int index) {
    final ctrl = list[index];
    setState(() {
      list.removeAt(index);
    });
    ctrl.dispose();
  }

  @override
  void dispose() {
    for (final c in list) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          for (int index = 0; index < list.length; index++)
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (String? s) {
                      if (s == null || s.isEmpty) {
                        return 'Empty text not allowed';
                      }
                      if (list
                              .where((element) => element.text == s)
                              .toList()
                              .length >
                          1) {
                        return 'Must be unique';
                      }
                      return null;
                    },
                    controller: list[index],
                    maxLength: 50,
                    decoration: const InputDecoration(counterText: ''),
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteString(index),
                ),
              ],
            ),
          const SizedBox(
            height: 16,
          ),
          TextButton.icon(
            onPressed: _addString,
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Meal',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(list.map((e) => e.text).toList());
                AutoRouter.of(context).pop();
              }
            },
            icon: const Icon(Icons.done_rounded),
            label: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
