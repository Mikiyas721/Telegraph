import 'package:flutter/material.dart';

class MyThemeData {
  static final defaultLight = ThemeData.light();
  static final defaultDark = ThemeData.dark();
  static final defaultLerp = ThemeData.lerp(ThemeData.fallback(), defaultDark, 2);
}
