import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/app/core/widgets/text_widget.dart';
import 'package:todo_app/app/modules/todos/interactor/controllers/todo_controller.dart';
import 'package:todo_app/app/modules/todos/interactor/state/todo_state.dart';
import 'package:todo_app/app/modules/todos/ui/widgets/todo_tile_widget.dart';

class TodoPage extends StatefulWidget {
  final TodoController todoController;

  const TodoPage({
    super.key,
    required this.todoController,
  });

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();

    widget.todoController.loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: widget.todoController,
          builder: (context, state, _) {
            switch (state) {
              case TodoStateLoading _:
                return Center(
                  key: const ValueKey('Loading'),
                  child: SizedBox(
                    width: size.width * .8,
                    child: Lottie.asset(
                      'assets/animations/loading.json',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                );

              case TodoStateSuccess todosSuccess:
                return Padding(
                  key: const ValueKey('success'),
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(
                          left: 60.0 - 25.0,
                          top: 16.0,
                          bottom: 20,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: SizedBox(
                            child: TextWidget.title('Today'),
                          ),
                        ),
                      ),
                      SliverList.builder(
                        itemCount: todosSuccess.todos.length,
                        itemBuilder: (context, index) {
                          final todo = todosSuccess.todos[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: TodoTileWidget(
                              title: todo.title,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );

              case TodoStateFailure _:
                return Container(
                  key: const ValueKey('failure'),
                );

              default:
                return Container(
                  key: const ValueKey('default'),
                );
            }
          },
        ),
      ),
    );
  }
}
