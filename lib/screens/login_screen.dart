// import 'package:auto_route/auto_route.dart';
// import 'package:bite_trace/providers.dart';
// import 'package:bite_trace/routing/router.gr.dart';
// import 'package:bite_trace/service/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
// class LoginScreen extends ConsumerWidget {
//   LoginScreen({super.key});

//   final email = TextEditingController();
//   final pw = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authService = ref.read(authServiceProvider);
//     final error = ref.watch(loginErrorProvider);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: email,
//                 decoration: const InputDecoration(labelText: 'Email'),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: pw,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   final user = await authService.signInWithEmailAndPassword(
//                     email.text,
//                     pw.text,
//                   );
//                   if (user != null) {
//                     ref.read(routerProvider).replace(const HomeRoute());
//                   }
//                 },
//                 child: const Text('Login'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   final user = await authService.registerWithEmailAndPassword(
//                     email.text,
//                     pw.text,
//                   );
//                   if (user != null) {
//                     final data = await ref.read(accountDataProvider.future);
//                     if (data == null) {
//                       ref.read(routerProvider).push(RegisterRoute());
//                     } else {
//                       ref.read(routerProvider).replace(const HomeRoute());
//                     }
//                   }
//                 },
//                 child: const Text('Register'),
//               ),
//               if (error != null)
//                 Text(
//                   error,
//                   style: TextStyle(color: Theme.of(context).colorScheme.error),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
