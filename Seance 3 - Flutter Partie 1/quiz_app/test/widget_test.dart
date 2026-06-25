import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Quiz flow: answer both questions, see score, restart', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Tab Demo'), findsOneWidget);
    expect(find.text('1/2'), findsOneWidget);
    expect(find.textContaining('Q 1 -'), findsOneWidget);

    // Answer question 1 with the correct answer (C)
    await tester.tap(find.text('C - Both of the above.').first);
    await tester.pumpAndSettle();

    expect(find.text('2/2'), findsOneWidget);
    expect(find.textContaining('Q 8 -'), findsOneWidget);

    // Answer question 2 with the correct answer (C)
    await tester.tap(find.text('C - Both of the above.').first);
    await tester.pumpAndSettle();

    // Both answers correct -> score should be 100%
    expect(find.textContaining('100.0 %'), findsOneWidget);

    // Restart resets to question 1
    await tester.tap(find.text('Restart'));
    await tester.pumpAndSettle();
    expect(find.text('1/2'), findsOneWidget);
  });

  testWidgets('Weather tab shows the city search field', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.transit_enterexit));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, 'Tape une ville...'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
