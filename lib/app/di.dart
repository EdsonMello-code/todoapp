import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/app/core/services/http_service/http_service.dart';
import 'package:todo_app/app/core/services/http_service/http_service_impl.dart';
import 'package:todo_app/app/core/utils/unit.dart';
import 'package:todo_app/app/modules/todos/controllers/todo_controller.dart';
import 'package:todo_app/app/modules/todos/services/todo_service.dart';
import 'package:todo_app/app/modules/todos/services/todo_service_impl.dart';

var getIt = GetIt.instance;

Unit setup() {
  getIt = GetIt.asNewInstance();
  getIt.registerSingleton<Dio>(
    Dio(),
  );

  getIt.registerSingleton<HttpService>(
    HttpServiceImpl(
      'https://jsonplaceholder.typicode.com',
      httpClient: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<TodoService>(
    TodoServiceImpl(
      httpClient: getIt.get<HttpService>(),
    ),
  );

  getIt.registerSingleton<TodoController>(
    TodoController(
      todoService: getIt.get<TodoService>(),
    ),
  );
  return unit;
}
