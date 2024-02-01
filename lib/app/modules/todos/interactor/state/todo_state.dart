import 'package:todo_app/app/core/exceptions/app_exceptions.dart';
import 'package:todo_app/app/modules/todos/interactor/models/todo_model.dart';

sealed class TodoState {
  final List<TodoModel> todos;
  final AppException? todoException;
  final bool isLoading;

  const TodoState({
    required this.todos,
    this.todoException,
    required this.isLoading,
  });

  factory TodoState.initial() => const TodoStateLoading(
        todos: [],
      );

  TodoState setTodos(List<TodoModel> todos) {
    return TodoStateSuccess(
      todos: todos,
    );
  }

  TodoState setLoading() {
    return TodoStateLoading(
      todos: todos,
    );
  }

  TodoState setError(AppException exception) {
    return TodoStateFailure(
      todos: todos,
      todoException: exception,
    );
  }
}

class TodoStateLoading extends TodoState {
  const TodoStateLoading({
    required super.todos,
  }) : super(isLoading: true);
}

class TodoStateSuccess extends TodoState {
  const TodoStateSuccess({
    required super.todos,
  }) : super(isLoading: false);
}

class TodoStateFailure extends TodoState {
  TodoStateFailure({
    required super.todos,
    required super.todoException,
  }) : super(isLoading: false);
}
