import 'package:flutter_test/flutter_test.dart';
import 'package:app_synthese/models/tic_tac_toe.dart';

void main() {
  test('X gagne sur la première ligne', () {
    final game = TicTacToe();
    game.play(0); // X
    game.play(3); // O
    game.play(1); // X
    game.play(4); // O
    game.play(2); // X -> ligne 0,1,2
    expect(game.winner(), 'X');
  });

  test('un coup sur une case occupée est ignoré', () {
    final game = TicTacToe();
    game.play(0); // X
    game.play(0); // tentative O sur case occupée -> ignorée
    expect(game.cells[0], 'X');
    expect(game.currentPlayer, 'O');
  });

  test('isFull détecte un plateau complet (match nul)', () {
    final game = TicTacToe();
    // Séquence menant à un match nul, sans victoire intermédiaire.
    for (final i in [0, 1, 2, 4, 3, 5, 7, 6, 8]) {
      game.play(i);
    }
    expect(game.isFull, isTrue);
    expect(game.winner(), isNull);
  });
}
