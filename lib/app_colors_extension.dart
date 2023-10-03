import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

extension FlexSchemeExtension on FlexScheme {
  List<ThemeExtension> ext() => _extensions(index);

  List<ThemeExtension> _extensions(int idx) {
    return [
      if (idx < AppColorsExtension.customColors.length)
        AppColorsExtension.customColors[idx],
    ];
  }
}

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
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

  static const List<AppColorsExtension> customColors = [
    AppColorsExtension(
      carbColor: Color(0xffCCD32E),
      fatColor: Color(0xffF6801D),
      proteinColor: Color(0xffEA2E20),
    ),
    AppColorsExtension(
      carbColor: Color(0xffEFEF14),
      fatColor: Color(0xffF8B618),
      proteinColor: Color(0xffE73B3F),
    ),
    AppColorsExtension(
      carbColor: Color(0xff35E3DA),
      fatColor: Color(0xffF6B620),
      proteinColor: Color(0xffDF3B1B),
    ),
    AppColorsExtension(
      carbColor: Color(0xff039be5),
      fatColor: Color(0xffc2185b),
      proteinColor: Color(0xff3949ab),
    ),
    AppColorsExtension(
      carbColor: Color(0xff919FCB),
      fatColor: Color(0xff4F91B6),
      proteinColor: Color(0xffEF233C),
    ),
    AppColorsExtension(
      carbColor: Color(0xff4c9bba),
      fatColor: Color(0xffff4f58),
      proteinColor: Color(0xff35a0cb),
    ),
    AppColorsExtension(
      carbColor: Color(0xff35a0cb),
      fatColor: Color(0xff89d1c8),
      proteinColor: Color(0xff3b5998),
    ),
    AppColorsExtension(
      carbColor: Color(0xff3b5998),
      fatColor: Color(0xff55acee),
      proteinColor: Color(0xff223a5e),
    ),
    AppColorsExtension(
      carbColor: Color(0xff223a5e),
      fatColor: Color(0xff144955),
      proteinColor: Color(0xffce5b78),
    ),
    AppColorsExtension(
      carbColor: Color(0xffce5b78),
      fatColor: Color(0xfffbae9d),
      proteinColor: Color(0xffcd5758),
    ),
    AppColorsExtension(
      carbColor: Color(0xffcd5758),
      fatColor: Color(0xff57c8d3),
      proteinColor: Color(0xffc62828),
    ),
    AppColorsExtension(
      carbColor: Color(0xffc62828),
      fatColor: Color(0xffad1457),
      proteinColor: Color(0xff9b1b30),
    ),
    AppColorsExtension(
      carbColor: Color(0xff9b1b30),
      fatColor: Color(0xffa70043),
      proteinColor: Color(0xff450a0f),
    ),
    AppColorsExtension(
      carbColor: Color(0xff450a0f),
      fatColor: Color(0xff60234f),
      proteinColor: Color(0xff2e7d32),
    ),
    AppColorsExtension(
      carbColor: Color(0xff2e7d32),
      fatColor: Color(0xff00695c),
      proteinColor: Color(0xff264e36),
    ),
    AppColorsExtension(
      carbColor: Color(0xff264e36),
      fatColor: Color(0xff797b3a),
      proteinColor: Color(0xff004e15),
    ),
    AppColorsExtension(
      carbColor: Color(0xff004e15),
      fatColor: Color(0xff007256),
      proteinColor: Color(0xff37474f),
    ),
    AppColorsExtension(
      carbColor: Color(0xff37474f),
      fatColor: Color(0xff521d82),
      proteinColor: Color(0xff738625),
    ),
    AppColorsExtension(
      carbColor: Color(0xff738625),
      fatColor: Color(0xff893789),
      proteinColor: Color(0xffb86914),
    ),
    AppColorsExtension(
      carbColor: Color(0xffb86914),
      fatColor: Color(0xffef6c00),
      proteinColor: Color(0xffc78d20),
    ),
    AppColorsExtension(
      carbColor: Color(0xffc78d20),
      fatColor: Color(0xff8d9440),
      proteinColor: Color(0xffe65100),
    ),
    AppColorsExtension(
      carbColor: Color(0xff1d2228),
      fatColor: Color(0xfffb8122),
      proteinColor: Color(0xff1a2c42),
    ),
    AppColorsExtension(
      carbColor: Color(0xff1a2c42),
      fatColor: Color(0xffe59a18),
      proteinColor: Color(0xffc96646),
    ),
    AppColorsExtension(
      carbColor: Color(0xffc96646),
      fatColor: Color(0xff373a36),
      proteinColor: Color(0xff095d9e),
    ),
    AppColorsExtension(
      carbColor: Color(0xff095d9e),
      fatColor: Color(0xffdd520f),
      proteinColor: Color(0xff2d4421),
    ),
    AppColorsExtension(
      carbColor: Color(0xff2d4421),
      fatColor: Color(0xffd34b4b),
      proteinColor: Color(0xff452f2b),
    ),
    AppColorsExtension(
      carbColor: Color(0xff452f2b),
      fatColor: Color(0xffe3b964),
      proteinColor: Color(0xff1f3339),
    ),
    AppColorsExtension(
      carbColor: Color(0xff1f3339),
      fatColor: Color(0xffd2600a),
      proteinColor: Color(0xff023047),
    ),
    AppColorsExtension(
      carbColor: Color(0xff023047),
      fatColor: Color(0xfff86541),
      proteinColor: Color(0xff375778),
    ),
    AppColorsExtension(
      carbColor: Color(0xff375778),
      fatColor: Color(0xfff98d94),
      proteinColor: Color(0xff5c000e),
    ),
    AppColorsExtension(
      carbColor: Color(0xff5c000e),
      fatColor: Color(0xff74540e),
      proteinColor: Color(0xff19647e),
    ),
    AppColorsExtension(
      carbColor: Color(0xff19647e),
      fatColor: Color(0xfffeb716),
      proteinColor: Color(0xff4496e0),
    ),
    AppColorsExtension(
      carbColor: Color(0xff4496e0),
      fatColor: Color(0xff202b6d),
      proteinColor: Color(0xff6750a4),
    ),
    AppColorsExtension(
      carbColor: Color(0xff6750a4),
      fatColor: Color(0xff625b71),
      proteinColor: Color(0xff616200),
    ),
    AppColorsExtension(
      carbColor: Color(0xff616200),
      fatColor: Color(0xff606042),
      proteinColor: Color(0xff386a20),
    ),
    AppColorsExtension(
      carbColor: Color(0xff386a20),
      fatColor: Color(0xff55624c),
      proteinColor: Color(0xffbb1614),
    ),
    AppColorsExtension(
      carbColor: Color(0xffbb1614),
      fatColor: Color(0xff96482b),
      proteinColor: Color(0xffbc004b),
    ),
    AppColorsExtension(
      carbColor: Color(0xffbc004b),
      fatColor: Color(0xff9b4050),
      proteinColor: Color(0xff9a25ae),
    ),
    AppColorsExtension(
      carbColor: Color(0xffbc004b),
      fatColor: Color(0xff9b4050),
      proteinColor: Color(0xff9a25ae),
    ),
    AppColorsExtension(
      carbColor: Color(0xff9a25ae),
      fatColor: Color(0xff8728cf),
      proteinColor: Color(0xff4355b9),
    ),
    AppColorsExtension(
      carbColor: Color(0xff4355b9),
      fatColor: Color(0xff3c64ae),
      proteinColor: Color(0xff0061a4),
    ),
    AppColorsExtension(
      carbColor: Color(0xff0061a4),
      fatColor: Color(0xff006781),
      proteinColor: Color(0xff006876),
    ),
    AppColorsExtension(
      carbColor: Color(0xff006876),
      fatColor: Color(0xff476365),
      proteinColor: Color(0xff006a60),
    ),
    AppColorsExtension(
      carbColor: Color(0xff006a60),
      fatColor: Color(0xff4a635f),
      proteinColor: Color(0xff006e1c),
    ),
    AppColorsExtension(
      carbColor: Color(0xff006e1c),
      fatColor: Color(0xff36855e),
      proteinColor: Color(0xff556500),
    ),
    AppColorsExtension(
      carbColor: Color(0xff556500),
      fatColor: Color(0xff8c7519),
      proteinColor: Color(0xff695f00),
    ),
    AppColorsExtension(
      carbColor: Color(0xff695f00),
      fatColor: Color(0xff7c7b16),
      proteinColor: Color(0xff8b5000),
    ),
    AppColorsExtension(
      carbColor: Color(0xff8b5000),
      fatColor: Color(0xffb6602f),
      proteinColor: Color(0xffbf360c),
    ),
    AppColorsExtension(
      carbColor: Color(0xffbf360c),
      fatColor: Color(0xffbe593b),
      proteinColor: Color(0xff6200ee),
    ),
  ];
}
