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
    Map<DateTime, DiaryEntryState>? entries,
  }) : _entries = entries ?? {};

  final Map<DateTime, DiaryEntryState> _entries;

  DiaryEntryState? getEntry(DateTime date) {
    return _entries[date.atMidday()];
  }

  void setEntry(DateTime date, DiaryEntryState entry) {
    _entries[date.atMidday()] = entry;
  }

  DiaryState copyWithEntry({
    required DateTime dateTime,
    required DiaryEntryState entry,
  }) {
    return DiaryState(
      entries: {..._entries, dateTime.atMidday(): entry},
    );
  }
}
