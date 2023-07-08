import 'package:flutter/material.dart';
import 'package:todo_app/app/core/utils/unit.dart';
import 'package:todo_app/app/modules/todos/data/services/todo_service.dart';
import 'package:todo_app/app/modules/todos/interactor/state/todo_state.dart';

class TodoController extends ValueNotifier<TodoState> {
  final TodoService todoService;

  TodoController({
    required this.todoService,
  }) : super(
          TodoStateLoading(),
        );

  Future<Unit> loadTodos() async {
    final todosState = await todoService.getTodos();

    await Future.delayed(const Duration(seconds: 3));

    value = todosState;
    return unit;
  }
}
