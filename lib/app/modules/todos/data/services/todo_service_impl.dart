import 'dart:core';

import 'package:todo_app/app/core/exceptions/app_exceptions.dart';
import 'package:todo_app/app/core/services/http_service/http_service.dart';
import 'package:todo_app/app/modules/todos/data/services/todo_service.dart';
import 'package:todo_app/app/modules/todos/interactor/models/todo_model.dart';

import '../../interactor/state/todo_state.dart';

class TodoServiceImpl implements TodoService {
  final HttpService _httpClient;

  TodoServiceImpl({
    required HttpService httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<TodoState> getTodos() async {
    try {
      final response = await _httpClient.get('/todos');

      final todos = List<Map<String, dynamic>>.from(response.data)
          .map(
            TodoModel.fromMap,
          )
          .toList();

      return TodoStateSuccess(todos);
    } on AppException catch (error) {
      return TodoStateFailure(error);
    }
  }
}
