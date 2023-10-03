import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/routing/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: AccountRoute.page),
            AutoRoute(page: DiaryRoute.page),
            AutoRoute(page: FriendsRoute.page),
            AutoRoute(page: ExerciseRoute.page),
          ],
        ),
        // AutoRoute(page: LoginRoute.page),
        // AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: FoodSearchRoute.page),
        AutoRoute(page: FoodDetailsRoute.page),
        AutoRoute(page: FriendsDiaryRoute.page),
        AutoRoute(page: MealDetailsRoute.page),
        AutoRoute(page: BarcodeScanRoute.page),
      ];
}
