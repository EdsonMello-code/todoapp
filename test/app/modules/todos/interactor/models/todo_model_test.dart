import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/modules/todos/interactor/models/todo_model.dart';

void main() {
  late TodoModel todoModel;
  setUp(() {
    todoModel = TodoModel(
      title: 'Title',
      isSelected: true,
    );
  });
  group('TodoPage ->', () {
    group(
      'toggleSelected ->',
      () {
        test('Should change isSelected true -> false', () {
          todoModel.toggleSelected();
          expect(
            todoModel.isSelected,
            false,
          );
        });
      },
    );
  });
}
