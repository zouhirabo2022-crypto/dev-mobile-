import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  static const String _endpoint =
      'https://api.groq.com/openai/v1/chat/completions';

  String get _apiKey => dotenv.env['GROQ_API_KEY'] ?? '';
  String get _model => dotenv.env['GROQ_MODEL'] ?? 'llama-3.3-70b-versatile';

  Future<String> sendMessage(List<Map<String, String>> messages) async {
    if (_apiKey.isEmpty) {
      throw Exception(
        'Clé API manquante. Renseigne GROQ_API_KEY dans le fichier .env',
      );
    }

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'model': _model,
        'messages': messages,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Erreur API (${response.statusCode}): ${response.body}',
      );
    }

    final data = jsonDecode(utf8.decode(response.bodyBytes));
    return data['choices'][0]['message']['content'].toString().trim();
  }
}
