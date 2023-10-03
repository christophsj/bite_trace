import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/date_time_extension.dart';

class DiaryEntryState {
  const DiaryEntryState({
    this.entry,
    this.error,
  });

  final DiaryEntry? entry;
  final Object? error;

  bool get loading => entry == null && error == null;
  bool get hasError => error != null;

  DiaryEntryState copyWith({
    DiaryEntry? entry,
    dynamic error,
  }) {
    return DiaryEntryState(
      entry: entry ?? this.entry,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'DiaryEntryState(entry: $entry, error: $error)';
}

class DiaryState {
  DiaryState({
    Map<String, Map<DateTime, DiaryEntryState>>? entries,
  }) : _entries = entries ?? {};

  final Map<String, Map<DateTime, DiaryEntryState>> _entries;

  DiaryEntryState? getEntry(String userId, DateTime date) {
    return _entries[userId]?[date.atMidday()];
  }

  void setEntry(String userId, DateTime date, DiaryEntryState entry) {
    if (_entries[userId] == null) {
      _entries[userId] = {};
    }
    _entries[userId]![date.atMidday()] = entry;
  }

  DiaryState copyWithEntry({
    required String userId,
    required DateTime dateTime,
    required DiaryEntryState entry,
  }) {
    return DiaryState(
      entries: {
        ..._entries,
        userId: {..._entries[userId] ?? {}, dateTime.atMidday(): entry},
      },
    );
  }
}
