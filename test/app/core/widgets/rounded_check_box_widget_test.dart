import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/core/themes/app_icons_theme.dart';
import 'package:todo_app/app/core/widgets/rounded_check_box_widget.dart';

import '../utils/make_testable.dart';

void main() {
  group('RoundedCheckBoxWidget ->', () {
    testWidgets('Should has icon of marked then isChecked is true',
        (tester) async {
      await tester.pumpWidget(
        makeTestable(
          const RoundedCheckBoxWidget(
            isChecked: true,
          ),
        ),
      );

      final Finder appCheckedIcon = find.byType(AppIconsTheme);
      expect(appCheckedIcon, findsOneWidget);

      final AppIconsTheme icon = tester.widget(
        appCheckedIcon,
      );
      expect(icon.imageUrl, 'assets/icons/marked.png');
    });

    testWidgets(
      'Should has only container with color trasparent and border grey then isSelected is False',
      (tester) async {
        await tester.pumpWidget(
          makeTestable(
            const RoundedCheckBoxWidget(),
          ),
        );

        final Finder finderContainerWithBackgroundTransparentAndBorderGrey =
            find.byType(Container);

        expect(
          finderContainerWithBackgroundTransparentAndBorderGrey,
          findsOneWidget,
        );

        final Container containerWithBackgroundTransparentAndBorderGrey =
            tester.widget(
          finderContainerWithBackgroundTransparentAndBorderGrey,
        );

        final boxDecoration = containerWithBackgroundTransparentAndBorderGrey
            .decoration as BoxDecoration;

        expect(
          boxDecoration.color.toString(),
          'Color(0x00000000)',
        );

        expect(
          boxDecoration.border!.bottom.color.toString(),
          'C${'olor(0xFFEBEFF5)'.toLowerCase()}',
        );
      },
    );

    testWidgets(
      'Should switch state to checked then this widget is clicked one time',
      (tester) async {
        await tester.pumpWidget(
          makeTestable(
            const RoundedCheckBoxWidget(),
          ),
        );

        final gestureFinder = find.byType(GestureDetector);

        expect(
          gestureFinder,
          findsOneWidget,
        );

        await tester.tap(gestureFinder);
        await tester.pump();

        final finderIconChecked = find.byType(AppIconsTheme);

        expect(
          finderIconChecked,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Should switch state to unChecked then this widget is clicked two time',
      (tester) async {
        await tester.pumpWidget(
          makeTestable(
            const RoundedCheckBoxWidget(),
          ),
        );

        final gestureFinder = find.byType(GestureDetector);

        expect(
          gestureFinder,
          findsOneWidget,
        );

        await tester.tap(gestureFinder);
        await tester.tap(gestureFinder);
        await tester.pump();

        final finderIconChecked = find.byType(Container);

        expect(
          finderIconChecked,
          findsOneWidget,
        );
      },
    );
  });
}
