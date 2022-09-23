import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color accentLight = Color(0xFFDC2828);
  static const Color deletedItem = Color(0xFFFFE9E9);
  static const Color deletedItemBorder = Color(0xFFF1A9A9);
  static List<Color> borderGr = [const Color(0xff686868), const Color(0xff979797).withOpacity(0)];
  static Color bottomPanelBg = const Color(0xff3E3B37);
  static Color dividerColor = const Color(0xff4A4A4A);
  static Color defHistoryColor = const Color(0xff2A2A34);
  static Color defHistoryBgColor = const Color(0xff0E0E13);
  static Color labelColor = const Color(0xffC2C1C1);

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFFDA4ECB,
    <int, Color>{
      1: Color(0xFFDA4ECB),
      2: Color(0xFF2C3AE8),
      3: Color(0xFF467FC9),
      4: Color(0xFF1A1A1A),
      5: Color(0xFFFF0000),
      6: Color(0xFF4B5CF5),
    },
  );

  static BaseColor baseLight = BaseColor(
    0xFFFFFFFF,
    <int, Color>{
      100: Colors.white,
      50: const Color(0xFFF4F4F4),
      80: Colors.white.withOpacity(.8),
      40: Colors.white.withOpacity(.4),
      20: Colors.white.withOpacity(.2),
      60: Colors.white.withOpacity(.6),
    },
  );
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade80 => this[80]!;

  Color get shade20 => this[20]!;

  Color get shade60 => this[60]!;
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade1 => this[1]!;

  Color get shade2 => this[2]!;

  Color get shade3 => this[3]!;

  Color get shade5 => this[5]!;

  Color get scaffoldBg => this[4]!;

  Color get line => this[6]!;
}
