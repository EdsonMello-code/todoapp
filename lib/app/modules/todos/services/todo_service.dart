import 'package:todo_app/app/core/utils/either.dart';
import 'package:todo_app/app/modules/todos/exceptions/todo_exception.dart';
import 'package:todo_app/app/modules/todos/models/todo_model.dart';

abstract interface class TodoService {
  Future<Either<TodoException, List<TodoModel>>> getTodos();
}
