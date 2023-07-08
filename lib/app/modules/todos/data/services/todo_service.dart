import '../../interactor/state/todo_state.dart';

abstract interface class TodoService {
  Future<TodoState> getTodos();
}
