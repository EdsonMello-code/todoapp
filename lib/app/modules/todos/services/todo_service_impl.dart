import 'dart:core';

import 'package:todo_app/app/core/exceptions/app_exceptions.dart';
import 'package:todo_app/app/core/services/http_service/http_service.dart';
import 'package:todo_app/app/core/utils/either.dart';
import 'package:todo_app/app/modules/todos/exceptions/todo_exception.dart';
import 'package:todo_app/app/modules/todos/models/todo_model.dart';
import 'package:todo_app/app/modules/todos/services/todo_service.dart';

class TodoServiceImpl implements TodoService {
  final HttpService _httpClient;

  TodoServiceImpl({
    required HttpService httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Either<TodoException, List<TodoModel>>> getTodos() async {
    try {
      final response = await _httpClient.get('/todos');

      final todos = List<Map<String, dynamic>>.from(response.data).map(
        TodoModel.fromMap,
      );

      return Right(todos.toList());
    } on AppException catch (error) {
      return Left(
        TodoException(error.message),
      );
    }
  }
}
