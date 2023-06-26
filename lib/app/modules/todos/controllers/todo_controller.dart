import 'package:flutter/material.dart';
import 'package:todo_app/app/core/utils/unit.dart';
import 'package:todo_app/app/modules/todos/controllers/todo_state.dart';
import 'package:todo_app/app/modules/todos/services/todo_service.dart';

class TodoController extends ValueNotifier<TodoState> {
  final TodoService todoService;

  TodoController({
    required this.todoService,
  }) : super(
          TodoStateLoading(),
        );

  Future<Unit> loadTodos() async {
    final response = await todoService.getTodos();

    await Future.delayed(const Duration(seconds: 3));
    response.fold(
      right: (todos) {
        value = TodoStateSuccess(todos);
        return unit;
      },
      left: (exception) {
        value = TodoStateFailure(exception);
        return unit;
      },
    );
    return unit;
  }
}
