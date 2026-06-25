// Logique pure du morpion (testable indépendamment du widget), pour
// illustrer la navigation avec passage de données (page 52/54 du support).
class TicTacToe {
  List<String> cells = List.filled(9, '');
  String currentPlayer = 'X';

  void play(int index) {
    if (cells[index].isNotEmpty || winner() != null) return;
    cells[index] = currentPlayer;
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  static const List<List<int>> _lines = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6],
  ];

  String? winner() {
    for (final line in _lines) {
      final a = cells[line[0]], b = cells[line[1]], c = cells[line[2]];
      if (a.isNotEmpty && a == b && b == c) return a;
    }
    return null;
  }

  bool get isFull => cells.every((c) => c.isNotEmpty);
}
