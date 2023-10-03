import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/screens/home/diary.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/widgets/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

class HomeWidgetData {
  HomeWidgetData({this.goals, this.foods});

  final NutrientGoals? goals;
  final List<Food>? foods;

  @override
  int get hashCode => toString().hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeWidgetData &&
        goals == other.goals &&
        listEquals(foods, other.foods);
  }
}

final homeWidgetDataProvider = StateProvider<HomeWidgetData>((ref) {
  final accState = ref.watch(accountStateProvider);
  final diaryState = ref.watch(diaryProvider);

  final user = accState.getData();

  if (user != null) {
    final diaryEntry =
        diaryState.getEntry(user.id, DateTime.now().atMidday())?.entry;

    if (diaryEntry == null) {
      return HomeWidgetData();
    }

    final goals = DiarySection.getValidGoals(
      diaryEntry,
      user,
    );
    return HomeWidgetData(
      goals: goals,
      foods: diaryEntry.meals!
          .map((e) => e.foods)
          .expand((element) => element)
          .toList(),
    );
  }
  return HomeWidgetData();
});

class HomeWidgetService {
  HomeWidgetService({required this.ref}) {
    sub = ref.listen(
      homeWidgetDataProvider,
      (previous, next) {
        if (next.foods != null && next.goals != null) {
          if (previous != next) {
            sendAndUpdateDashboard(next.goals!, next.foods!);
          }
        }
      },
      fireImmediately: true,
    );
  }
  final Ref ref;
  late final ProviderSubscription<HomeWidgetData> sub;

  void cancel() {
    sub.close();
  }

  Future _sendData(NutrientGoals goals, List<Food> foods) async {
    try {
      return Future.wait([
        HomeWidget.renderFlutterWidget(
          Theme(
            data: ref.read(lightThemeProvider),
            child: Dashboard(
              goals,
              foods,
              elevation: 0,
              verticalPadding: 0,
            ),
          ),
          logicalSize: const Size(394, 160),
          key: 'dashIcon',
        ),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  Future _updateWidget() async {
    try {
      return HomeWidget.updateWidget(
        name: 'MyHomeWidget',
        iOSName: 'MyHomeWidget',
      );
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
  }

  Future<void> sendAndUpdateDashboard(
    NutrientGoals goals,
    List<Food> foods,
  ) async {
    safePrint('Update widget data');
    await _sendData(goals, foods);
    await _updateWidget();
  }
}
