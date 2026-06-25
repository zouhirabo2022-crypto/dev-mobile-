import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_chatbot/screens/chat_screen.dart';
import 'package:mobile_chatbot/widgets/chat_bubble.dart';

void main() {
  setUpAll(() {
    dotenv.testLoad(fileInput: 'GROQ_API_KEY=test\nGROQ_MODEL=test-model');
  });

  testWidgets('ChatScreen affiche l\'AppBar, le champ de saisie et le bouton envoi',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: ChatScreen()),
    );

    expect(find.text('ChatAI'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });

  testWidgets('La liste de messages est vide au démarrage',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: ChatScreen()),
    );

    expect(find.byType(ListView), findsOneWidget);
    // Aucune bulle de message au démarrage
    expect(find.byType(ChatBubble), findsNothing);
  });
}
