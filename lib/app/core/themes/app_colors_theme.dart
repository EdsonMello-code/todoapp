import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color black;
  final Color blue;
  final Color purple;
  final Color yellow;
  final Color red;
  final Color green;
  final Color grey;
  final Color white;

  const AppColorsTheme({
    required this.black,
    required this.blue,
    required this.purple,
    required this.yellow,
    required this.red,
    required this.green,
    required this.grey,
    required this.white,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? black,
    Color? blue,
    Color? list,
    Color? purple,
    Color? yellow,
    Color? red,
    Color? green,
    Color? grey,
    Color? white,
  }) {
    return AppColorsTheme(
      black: black ?? this.black,
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      yellow: yellow ?? this.yellow,
      red: red ?? this.red,
      green: green ?? this.green,
      grey: grey ?? this.grey,
      white: white ?? this.white,
    );
  }

  @override
  AppColorsTheme lerp(
    covariant AppColorsTheme? other,
    double t,
  ) {
    return AppColorsTheme(
      black: Color.lerp(black, other!.black, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}
