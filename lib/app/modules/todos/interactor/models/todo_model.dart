import 'package:todo_app/app/core/types/types.dart';
import 'package:todo_app/app/core/utils/unit.dart';

class TodoModel {
  final String title;
  bool isSelected;

  TodoModel({
    required this.title,
    required this.isSelected,
  });

  Unit toggleSelected() {
    isSelected = !isSelected;

    return unit;
  }

  factory TodoModel.fromMap(Json map) {
    return TodoModel(
      title: map['title'],
      isSelected: map['completed'],
    );
  }
}
