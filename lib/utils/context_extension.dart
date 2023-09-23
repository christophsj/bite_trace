import 'package:bite_trace/theme_extension.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension(
        carbColor: _CustomColors.carbColor,
        fatColor: _CustomColors.fatColor,
        proteinColor: _CustomColors.proteinColor,
      );
}

class _CustomColors {
  static const Color carbColor = Colors.teal;
  static const Color fatColor = Colors.pink;
  static const Color proteinColor = Colors.orange;
}
