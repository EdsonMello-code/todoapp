import 'package:flutter/material.dart';
import 'package:todo_app/app/core/extensions/emitter_mixin.dart';
import 'package:todo_app/app/core/utils/unit.dart';
import 'package:todo_app/app/modules/todos/data/services/todo_service.dart';
import 'package:todo_app/app/modules/todos/interactor/state/todo_state.dart';

class TodoController extends ValueNotifier<TodoState> with EmitterMixin {
  final TodoService todoService;

  TodoController({
    required this.todoService,
  }) : super(
          TodoState.initial(),
        );

  Future<Unit> loadTodos() async {
    final todosState = await todoService.getTodos(value);

    await Future.delayed(const Duration(seconds: 3));

    emit(todosState);
    return unit;
  }
}
