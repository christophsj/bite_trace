import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedElevatedButton extends StatefulWidget {
  const AnimatedElevatedButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
    this.checkColor,
    this.style,
  });

  final FutureOr<void> Function()? onPressed;
  final Widget? icon;
  final String? label;
  final Color? checkColor;
  final ButtonStyle? style;

  @override
  State<AnimatedElevatedButton> createState() => _AnimatedElevatedButtonState();
}

class _AnimatedElevatedButtonState extends State<AnimatedElevatedButton> {
  ButtonState state = ButtonState.defaultState;

  @override
  Widget build(BuildContext context) {
    if (widget.label == null) {
      assert(widget.icon != null);
      return IconButton(
        onPressed: _onPressed(),
        icon: _buildSwitcher(context, widget.icon!),
      );
    }
    final style = widget.style ??
        ElevatedButton.styleFrom(
          minimumSize: const Size(0, 42),
        );
    if (widget.icon == null) {
      return ElevatedButton(
        onPressed: _onPressed(),
        style: style,
        child: _buildSwitcher(context, _buildText()),
      );
    }
    return ElevatedButton.icon(
      onPressed: _onPressed(),
      style: style,
      icon: _buildSwitcher(context, widget.icon!),
      label: _buildText(),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.label!,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  void Function()? _onPressed() {
    return state == ButtonState.loading || widget.onPressed == null
        ? null
        : () async {
            setState(() {
              state = ButtonState.loading;
            });
            try {
              await widget.onPressed!();
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
          };
  }

  Widget _buildSwitcher(BuildContext context, Widget child) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: switch (state) {
        ButtonState.defaultState =>
          Container(key: const Key('0'), child: child),
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
            color: widget.checkColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
      },
    );
  }
}

enum ButtonState { defaultState, loading, done, error }
