import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_synthese/main.dart';

void main() {
  testWidgets('Drawer: navigation vers Counter et incrémentation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Counter'));
    await tester.pumpAndSettle();

    expect(find.text('Counter Value => 0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Counter Value => 1'), findsOneWidget);
  });

  testWidgets('Drawer: navigation vers Contacts et ajout d\'un contact',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Contacts'));
    await tester.pumpAndSettle();

    expect(find.text('Alice'), findsOneWidget);

    await tester.enterText(find.widgetWithText(TextField, 'Nom'), 'Nadia');
    await tester.enterText(find.widgetWithText(TextField, 'Téléphone'), '0600000099');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Nadia'), findsOneWidget);
  });

  testWidgets('Login -> Tic Tac Toe : passage de données entre deux écrans',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Démo navigation (Login → Tic Tac Toe)'));
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextField, 'Login'), 'Jamal');
    await tester.tap(find.text('Se Connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Tic Tac Toe - Joueur: Jamal'), findsOneWidget);

    await tester.tap(find.text('Back to Home Screen'));
    await tester.pumpAndSettle();

    expect(find.text('Écran de Connexion'), findsOneWidget);
  });
}
