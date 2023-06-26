import 'package:todo_app/app/core/exceptions/app_exceptions.dart';

class TodoException implements AppException {
  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  const TodoException(
    this.message, {
    this.stackTrace,
  });
}
