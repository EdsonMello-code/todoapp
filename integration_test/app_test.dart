import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/app/modules/todos/pages/widgets/todo_tile_widget.dart';
import 'package:todo_app/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('End-to-end test', () {
    testWidgets(
      'Should be go to TodoPage has loaded the todos',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.byType(TodoTileWidget), findsWidgets);
      },
    );
  });
}
