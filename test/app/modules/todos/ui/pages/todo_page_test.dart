import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/app/modules/todos/data/services/todo_service.dart';
import 'package:todo_app/app/modules/todos/interactor/controllers/todo_controller.dart';
import 'package:todo_app/app/modules/todos/interactor/models/todo_model.dart';
import 'package:todo_app/app/modules/todos/interactor/state/todo_state.dart';
import 'package:todo_app/app/modules/todos/ui/pages/todo_page.dart';

import '../../../../core/utils/make_testable.dart';

void main() {
  late TodoController todoController;

  late TodoService todoService;
  setUp(() {
    todoService = TodoServiceMock();
    todoController = TodoController(
      todoService: todoService,
    );
  });

  group(
    'TodoPage ->',
    () {
      testWidgets(
        'Should have state successfully',
        (tester) async {
          when(() => todoService.getTodos()).thenAnswer((_) {
            return Future.value(
              TodoStateSuccess(
                <TodoModel>[
                  TodoModel(
                    title: 'Delectus aut autem',
                    isSelected: false,
                  ),
                  TodoModel(
                    title: 'Delectus aut autem 2',
                    isSelected: true,
                  ),
                ],
              ),
            );
          });

          await tester.pumpWidget(
            makeTestable(
              TodoPage(
                todoController: todoController,
              ),
            ),
          );

          await tester.pumpAndSettle();

          final finderStateSuccess = find.byKey(
            const ValueKey('success'),
          );

          expect(finderStateSuccess, findsOneWidget);
        },
      );
    },
  );
}

class TodoServiceMock extends Mock implements TodoService {}
