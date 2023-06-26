import 'package:flutter/material.dart';
import 'package:todo_app/app/core/themes/app_colors_theme.dart';

class CustomTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF006CFF),
    scaffoldBackgroundColor: Colors.white,
    extensions: const [
      AppColorsTheme(
        black: Color(0xFF252A31),
        blue: Color(0xFF006CFF),
        purple: Color(0xFFB678FF),
        yellow: Color(0xFFFFE761),
        red: Color(0xFFF45D6D),
        green: Color(0xFF61DEA4),
        grey: Color(0xFFEBEFF5),
        white: Colors.white,
      ),
    ],
  );
}
