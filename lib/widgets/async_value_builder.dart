import 'package:bite_trace/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder(this.value,
      {super.key, required this.ondata, this.onerror, this.onloading,});

  final AsyncValue<T> value;
  final Widget Function(T) ondata;
  final Widget Function(Object?, StackTrace)? onerror;
  final Widget Function()? onloading;

  static final l = Logger();

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: ondata,
      error: onerror ??
          (e, stackTrace) {
            l.e('Error occured in future!', error: e, stackTrace: stackTrace);
            return ErrorView(
              error: e,
              stackTrace: stackTrace,
            );
          },
      loading: onloading ?? () => const CircularProgressIndicator(),
    );
  }
}
