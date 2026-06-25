import 'package:flutter/material.dart';
import 'package:app_synthese/pages/tic_tac_toe_page.dart';

// Premier écran de la démo de navigation (page 49/52 du support) :
// Navigator.push(MaterialPageRoute) vers TicTacToePage, avec passage du nom
// du joueur saisi dans le formulaire.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  void seConnecter() {
    final player = loginController.text.isEmpty ? 'Joueur' : loginController.text;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TicTacToePage(player: player)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Écran de Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: loginController,
              decoration: const InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: seConnecter,
              child: const Text('Se Connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
