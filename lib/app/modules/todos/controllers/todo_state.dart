import 'package:todo_app/app/modules/todos/exceptions/todo_exception.dart';
import 'package:todo_app/app/modules/todos/models/todo_model.dart';

sealed class TodoState {}

class TodoStateLoading implements TodoState {}

class TodoStateSuccess implements TodoState {
  final List<TodoModel> todos;

  const TodoStateSuccess(this.todos);
}

class TodoStateFailure implements TodoState {
  final TodoException todoException;

  const TodoStateFailure(this.todoException);
}
