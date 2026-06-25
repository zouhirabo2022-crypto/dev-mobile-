# ChatAI (Flutter + Groq)

Application multiplateforme (Android, iOS, web, Windows, macOS, Linux) simple type "ChatGPT" en Flutter, propulsée par l'API gratuite de Groq (modèles Llama).

## Mise en route (sur une machine avec Flutter installé)

1. Cloner le dépôt puis installer les dépendances :
   ```
   flutter pub get
   ```
2. Créer une clé gratuite sur https://console.groq.com/keys (aucune carte bancaire requise), copier `.env.example` en `.env` et renseigner ta clé :
   ```
   GROQ_API_KEY=gsk-xxxxxxxxxxxxxxxx
   GROQ_MODEL=llama-3.3-70b-versatile
   ```
3. Lancer l'application :
   ```
   flutter run
   ```
   (le `.env` n'est jamais versionné — voir `.gitignore`)

## Structure

- `lib/main.dart` — point d'entrée, charge le `.env`
- `lib/screens/chat_screen.dart` — écran de chat (liste de messages + champ de saisie)
- `lib/widgets/chat_bubble.dart` — bulle de message (utilisateur/bot)
- `lib/models/chat_message.dart` — modèle de message
- `lib/services/openai_service.dart` — appel à l'API Groq, compatible format OpenAI (`/v1/chat/completions`)
