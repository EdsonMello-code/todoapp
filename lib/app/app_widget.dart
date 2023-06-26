import 'package:flutter/material.dart';
import 'package:todo_app/app/core/themes/custom_theme.dart';
import 'package:todo_app/app/di.dart';
import 'package:todo_app/app/modules/todos/controllers/todo_controller.dart';
import 'package:todo_app/app/modules/todos/pages/todo_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.light,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return TodoPage(
            todoController: getIt.get<TodoController>(),
          );
        },
      },
    );
  }
}
