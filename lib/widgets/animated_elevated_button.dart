import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedElevatedButton extends StatefulWidget {
  const AnimatedElevatedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final FutureOr<void> Function() onPressed;
  final Widget icon;
  final Widget label;

  @override
  State<AnimatedElevatedButton> createState() => _AnimatedElevatedButtonState();
}

class _AnimatedElevatedButtonState extends State<AnimatedElevatedButton> {
  ButtonState state = ButtonState.defaultState;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: state == ButtonState.loading
          ? null
          : () async {
              setState(() {
                state = ButtonState.loading;
              });
              try {
                await widget.onPressed();
                setState(() {
                  state = ButtonState.done;
                });
              } catch (e) {
                setState(() {
                  state = ButtonState.error;
                });
              }
              Future.delayed(const Duration(seconds: 3), () {
                if (mounted) {
                  setState(() {
                    state = ButtonState.defaultState;
                  });
                }
              });
            },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: switch (state) {
          ButtonState.defaultState =>
            Container(key: const Key('0'), child: widget.icon),
          ButtonState.error =>
            Container(key: const Key('0'), child: const Icon(Icons.error)),
          ButtonState.loading => SizedBox(
              key: const Key('1'),
              height: Theme.of(context).iconTheme.size ?? 24.0,
              width: Theme.of(context).iconTheme.size ?? 24.0,
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ButtonState.done => Icon(
              Icons.check,
              key: const Key('2'),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
        },
      ),
      label: widget.label,
    );
  }
}

enum ButtonState { defaultState, loading, done, error }
