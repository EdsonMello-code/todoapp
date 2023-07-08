import 'package:todo_app/app/core/exceptions/app_exceptions.dart';
import 'package:todo_app/app/modules/todos/interactor/models/todo_model.dart';

sealed class TodoState {}

class TodoStateLoading implements TodoState {}

class TodoStateSuccess implements TodoState {
  final List<TodoModel> todos;

  const TodoStateSuccess(this.todos);
}

class TodoStateFailure implements TodoState {
  final AppException todoException;

  const TodoStateFailure(this.todoException);
}
