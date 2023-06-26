import 'package:flutter/material.dart';
import 'package:todo_app/app/core/themes/custom_theme.dart';

Widget makeTestable(Widget widget) => MaterialApp(
      home: widget,
      theme: CustomTheme.light,
    );
