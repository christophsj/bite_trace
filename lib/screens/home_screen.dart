import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/screens/register_screen.dart';
import 'package:bite_trace/widgets/diary_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(authProvider);

    if (accountState.initializing) {
      return Scaffold(
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
      );
    }

    if (!accountState.isRegistered) {
      return const RegisterScreen();
    }

    return _buildLoggedInContent(ref);
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
                  title: Text(
                    'Hi ${ref.read(authProvider).authUser?.username ?? ''}',
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
}
