import 'package:flutter/material.dart';
import 'package:app_synthese/models/tic_tac_toe.dart';

// Deuxième écran de la démo de navigation (reçoit "player" depuis LoginPage
// via le constructeur : passage de données entre deux routes, page 55).
class TicTacToePage extends StatefulWidget {
  final String player;

  const TicTacToePage({super.key, required this.player});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  final game = TicTacToe();

  @override
  Widget build(BuildContext context) {
    final winner = game.winner();
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe - Joueur: ${widget.player}')),
      body: Column(
        children: [
          if (winner != null)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Gagnant : $winner', style: const TextStyle(fontSize: 20, color: Colors.deepOrange)),
            )
          else if (game.isFull)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Match nul', style: TextStyle(fontSize: 20)),
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() => game.play(index)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange),
                    ),
                    child: Center(
                      child: Text(
                        game.cells[index],
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to Home Screen'),
          ),
        ],
      ),
    );
  }
}
