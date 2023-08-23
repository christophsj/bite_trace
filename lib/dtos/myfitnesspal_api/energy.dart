import 'package:freezed_annotation/freezed_annotation.dart';

part 'energy.g.dart';
part 'energy.freezed.dart';

@freezed
class Energy with _$Energy {
  const factory Energy({
    required String unit,
    required double value,
  }) = _Energy;

  factory Energy.fromJson(Map<String, Object?> json) => _$EnergyFromJson(json);
}
