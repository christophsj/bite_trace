import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/screens/register_screen.dart';
import 'package:bite_trace/widgets/async_value_builder.dart';
import 'package:bite_trace/widgets/diary_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountData = ref.watch(accountDataProvider);
    return AsyncValueBuilder(
      accountData,
      onloading: () => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
      ondata: (data) =>
          data == null ? const RegisterScreen() : _buildLoggedInContent(ref),
    );
  }
}

Widget _buildLoggedInContent(WidgetRef ref) {
  return AutoTabsRouter(
    routes: const [
      DiaryRoute(),
      ExerciseRoute(),
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
        appBar: AutoRouter.of(context).childControllers[0].current.name ==
                'DiaryRoute'
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_sharp),
              label: 'Exercise',
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

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
