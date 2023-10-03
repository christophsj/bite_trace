import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatastoreState {
  bool networkIsUp = true;
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
      if (hubEvent.eventName == 'networkStatus') {
        final status = hubEvent.payload as NetworkStatusEvent?;
        final bool networkIsUp = status?.active ?? false;
        state = DatastoreState()..networkIsUp = networkIsUp;
      }
    });
  }
}
