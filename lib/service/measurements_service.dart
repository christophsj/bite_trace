import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeasurementService {
  MeasurementService({required this.ref});

  final Ref ref;

  Future<Measurements?> createMeasurements(Measurements measurements) =>
      updateMeasurements(measurements);

  Future<Measurements?> updateMeasurements(Measurements measurements) async {
    try {
      await Amplify.DataStore.save(measurements);
      return measurements;
    } on DataStoreException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }

  Future<Measurements?> getMeasurements(String uid) async {
    try {
      final result = await Amplify.DataStore.query(
        Measurements.classType,
        where: Measurements.ID.eq(uid),
      );
      final measurements = result.isEmpty ? null : result.first;
      if (measurements?.weight != null) {
        return measurements!.copyWith(
          weight: measurements.weight!
            ..sort(
              (a, b) => a.date.compareTo(b.date),
            ),
        );
      }
      return measurements;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }
}
