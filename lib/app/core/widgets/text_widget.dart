import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/core/extensions/theme_extensions.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle style;

  const TextWidget({
    super.key,
    this.text = '',
    required this.textAlign,
    required this.style,
  });

  factory TextWidget.title(
    String text, {
    TextAlign? textAlign,
  }) {
    return TextWidget(
      textAlign: TextAlign.start,
      text: text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory TextWidget.normal(
    String text, {
    TextAlign? textAlign,
    TextStyle style = const TextStyle(
      fontSize: 18,
    ),
  }) {
    return TextWidget(
      textAlign: TextAlign.start,
      style: style,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        color: context.appColorsTheme.black,
      ).merge(style),
    );
  }
}
