import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatastoreState {
  DatastoreState({this.networkIsUp = true, this.ready = false});

  final bool networkIsUp;
  final bool ready;
}

final datastoreStateProvider =
    StateNotifierProvider<DatastoreService, DatastoreState>((ref) {
  final s = ref.watch(datastoreServiceProvider);
  return s;
});

final datastoreServiceProvider = StateProvider<DatastoreService>((ref) {
  return DatastoreService(ref: ref)..observeEvents();
});

class DatastoreService extends StateNotifier<DatastoreState> {
  DatastoreService({required this.ref}) : super(DatastoreState());

  final Ref ref;

  // ignore: cancel_subscriptions
  late StreamSubscription<DataStoreHubEvent> hubSubscription;

  void observeEvents() {
    hubSubscription = Amplify.Hub.listen(HubChannel.DataStore, (hubEvent) {
      if (hubEvent.type == DataStoreHubEventType.ready) {
        ref.read(accountServiceProvider).getAuthAccount();
        ref.read(snackbarServiceProvider).showBasic('Synced with database!');
        state = DatastoreState(
          networkIsUp: state.networkIsUp,
          ready: true,
        );
      } else if (hubEvent.type == DataStoreHubEventType.networkStatus) {
        final status = hubEvent.payload as NetworkStatusEvent?;
        final bool networkIsUp = status?.active ?? false;
        state = DatastoreState(
          networkIsUp: networkIsUp,
          ready: state.ready && networkIsUp,
        );
      }
    });
  }
}
