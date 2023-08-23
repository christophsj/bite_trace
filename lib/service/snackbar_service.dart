import 'package:flutter/material.dart';

class SnackbarService {
  final GlobalKey<ScaffoldMessengerState> key = GlobalKey();

  void showBasic(String content) {
    key.currentState?.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 10),
      ),
    );
  }
}
