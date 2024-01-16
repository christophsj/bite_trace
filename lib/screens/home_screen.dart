import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/screens/register_screen.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/datastore_service.dart';
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
      (final AccountStateLoggedOut _) =>
        _withStatusOverlay(const RegisterScreen(), ref, context)
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
          body: _withStatusOverlay(child, ref, context),
          appBar: MeasurementsRoute.name ==
                  AutoRouter.of(context).childControllers[0].current.name
              ? null
              : [
                  DiaryRoute.name,
                ].contains(
                  AutoRouter.of(context).childControllers[0].current.name,
                )
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
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.monitor_weight_outlined),
              //   label: 'Diary',
              // ),
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

  Widget _withStatusOverlay(Widget child, WidgetRef ref, BuildContext context) {
    return Builder(
      builder: (context) {
        final datastore = ref.watch(datastoreStateProvider);
        return Stack(
          alignment: Alignment.center,
          children: [
            child,
            if (!datastore.networkIsUp ||
                !datastore.ready && datastore.networkIsUp)
              Positioned(
                bottom: 25,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      if (!datastore.networkIsUp) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'network',
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                          ],
                        );
                      }
                      if (!datastore.ready && datastore.networkIsUp) {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sync,
                              color: Colors.yellow,
                              size: 14,
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
          ],
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
