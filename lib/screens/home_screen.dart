import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/screens/register_screen.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/widgets/diary_calendar.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return x(ref);
  }

  Widget x(WidgetRef ref) {
    final accountState = ref.watch(accountStateProvider);

    return switch (accountState) {
      (AccountStateInitializing _) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      (final AccountStateError s) => ErrorView(error: s),
      (final AccountStateReady _) => _buildLoggedInContent(ref),
      (final AccountStateLoggedOut _) => const RegisterScreen()
    };
  }

  Widget _buildLoggedInContent(WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        DiaryRoute(),
        FriendsRoute(),
        AccountRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          appBar: [
            DiaryRoute.name,
          ].contains(AutoRouter.of(context).childControllers[0].current.name)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(
                    130,
                  ),
                  child: SafeArea(
                    child: DiaryCalendar(),
                  ),
                )
              : AppBar(
                  title: FutureBuilder<AuthUser?>(
                    future: ref.read(userProvider.future),
                    builder: (context, snapshot) {
                      return Text('Hi ${snapshot.data?.username ?? ''}');
                    },
                  ),
                ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Diary',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
