import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/account_data.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/screens/login_screen.dart';
import 'package:bite_trace/screens/register_screen.dart';
import 'package:bite_trace/service/auth_service.dart';
import 'package:bite_trace/widgets/async_value_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    final accountData = ref.watch(accountDataProvider);

    return authStateChanges.when(
      data: (user) {
        if (user != null) {
          return AsyncValueBuilder(accountData,
              ondata: (data) => data == null
                  ? RegisterScreen()
                  : _buildLoggedInContent(data),);
        } else {
          return LoginScreen();
        }
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) {
        ref.read(loginErrorProvider.notifier).state = error.toString();
        return LoginScreen();
      },
    );
  }

  Widget _buildLoggedInContent(AccountData accountData) {
    return AutoTabsRouter(
        routes: const [
          DiaryRoute(),
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
              appBar: AppBar(
                title: Text('Hi, ${accountData.username}'),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month))
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book), label: 'Diary',),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_box), label: 'Account',),
                ],
              ),);
        },);
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
