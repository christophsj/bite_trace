import 'package:bite_trace/firebase_options.dart';
import 'package:bite_trace/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: BiteTraceApp()));
}

class BiteTraceApp extends ConsumerWidget {
  const BiteTraceApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(routerProvider);
    final sb = ref.read(snackbarServiceProvider);
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Bite Trace',
      scaffoldMessengerKey: sb.key,
      theme: FlexThemeData.light(scheme: FlexScheme.redWine),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.redWine),
    );
  }
}
