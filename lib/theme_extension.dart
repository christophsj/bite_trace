import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.carbColor,
    required this.fatColor,
    required this.proteinColor,
  });

  final Color carbColor;
  final Color fatColor;
  final Color proteinColor;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? carbColor,
    Color? fatColor,
    Color? proteinColor,
  }) {
    return AppColorsExtension(
      carbColor: carbColor ?? this.carbColor,
      fatColor: fatColor ?? this.fatColor,
      proteinColor: proteinColor ?? this.proteinColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      carbColor: Color.lerp(carbColor, other.carbColor, t)!,
      fatColor: Color.lerp(fatColor, other.fatColor, t)!,
      proteinColor: Color.lerp(proteinColor, other.proteinColor, t)!,
    );
  }
}
