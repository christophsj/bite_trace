import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/screens/home/diary.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FriendsDiaryScreen extends ConsumerStatefulWidget {
  const FriendsDiaryScreen(this.friendId, {super.key});

  final String friendId;

  @override
  ConsumerState<FriendsDiaryScreen> createState() => _FriendsDiaryScreenState();
}

class _FriendsDiaryScreenState extends ConsumerState<FriendsDiaryScreen> {
  late Future<AccountData?> f;

  @override
  void initState() {
    super.initState();
    f = ref.read(accountServiceProvider).getAccount(widget.friendId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: f,
          builder: (context, snapshot) => Text(
            '${snapshot.data?.name ?? ''} - ${ref.watch(selectedDayProvider).dateForCalendar()}',
            maxLines: 1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: f,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Diary(snapshot.data!);
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const Text('Account not found!?');
          }
          return const SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
