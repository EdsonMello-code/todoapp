import 'package:flutter/material.dart';
import 'package:todo_app/app/core/themes/app_colors_theme.dart';

extension ThemeExtension on BuildContext {
  AppColorsTheme get appColorsTheme =>
      Theme.of(this).extension<AppColorsTheme>()!;
}
