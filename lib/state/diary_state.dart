import 'package:bite_trace/models/daily_log.dart';

sealed class DiaryState {
  const factory DiaryState.initializing() = DiaryStateInitializing;
  const factory DiaryState.ready(DailyLog userlog) = DiaryStateReady;
  const factory DiaryState.error(String? errorText) = DiaryStateError;
}

class DiaryStateInitializing implements DiaryState {
  const DiaryStateInitializing();
}

class DiaryStateReady implements DiaryState {
  const DiaryStateReady(this.log);
  final DailyLog log;

  @override
  String toString() {
    return log.toString();
  }
}

class DiaryStateError implements DiaryState {

  const DiaryStateError(this.error);
  final String? error;
}
