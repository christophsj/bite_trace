import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/amplifyconfiguration.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  HomeWidget.setAppGroupId('HOME_WIDGET');
  runApp(const ProviderScope(child: BiteTraceApp()));
}

Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    final api = AmplifyAPI(
      options: APIPluginOptions(modelProvider: ModelProvider.instance),
    );

    await Amplify.addPlugins([api, auth]);
    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class BiteTraceApp extends ConsumerWidget {
  const BiteTraceApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeWidgetServiceProvider);
    return Authenticator(
      authenticatorBuilder: (context, state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn || AuthenticatorStep.onboarding:
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/logo.png'),
                    SignInForm(),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signUp,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            );
          case AuthenticatorStep.signUp:
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/logo.png'),
                    SignUpForm(),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: const Text('back to sign in'),
                    ),
                  ],
                ),
              ),
            );
          default:
            return null;
        }
      },
      initialStep: AuthenticatorStep.onboarding,
      child: MaterialApp.router(
        routerConfig: ref.read(routerProvider).config(),
        debugShowCheckedModeBanner: false,
        title: 'Bite Trace',
        builder: Authenticator.builder(),
        scaffoldMessengerKey: ref.read(snackbarServiceProvider).key,
        theme: ref.watch(lightThemeProvider),
        darkTheme: ref.watch(darkThemeProvider),
        themeMode: ref.watch(themeModeProvider),
        scrollBehavior: TouchAndMouseScroll(),
      ),
    );
  }
}

class TouchAndMouseScroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
