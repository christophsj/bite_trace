import 'package:flutter/material.dart';

class SnackbarService {
  final GlobalKey<ScaffoldMessengerState> key = GlobalKey();

  SnackBar basic(String s) => SnackBar(
        content: Text(
          s,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            key.currentState?.hideCurrentSnackBar();
          },
        ),
      );

  void showBasic(String s) {
    key.currentState?.showSnackBar(
      basic(s),
    );
  }
}
