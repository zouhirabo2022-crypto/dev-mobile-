import 'dart:math' as math;

// Fusion info.md (Exemple 2) + point.model.dart du PDF (Partie 2) :
// - constructeur positionnel + Point.origin() (info.md)
// - factory Point.from, fromJson, toJson (PDF)
// - affiche(), operator + (info.md)
// - distanceTo() (PDF, utilisé par Circle)
class Point {
  final double x;
  final double y;

  // info.md : constructeur positionnel avec liste d'initialisation
  const Point(this.x, this.y);

  // info.md : constructeur nommé
  const Point.origin() : x = 0, y = 0;

  // PDF : factory depuis une liste
  factory Point.from(List<double> data) {
    return Point(data[0], data[1]);
  }

  // PDF : constructeur JSON
  Point.fromJson(Map<String, dynamic> data)
      : x = (data['x'] as num).toDouble(),
        y = (data['y'] as num).toDouble();

  // PDF : sérialisation JSON
  Map<String, dynamic> toJson() => {'x': x, 'y': y};

  // info.md : affichage des coordonnées
  void affiche() => print("[$x,$y]");

  // PDF : représentation textuelle
  @override
  String toString() => "Point($x,$y)";

  // PDF + info.md : distance euclidienne
  double distanceTo(Point p) {
    var dx = x - p.x;
    var dy = y - p.y;
    return math.sqrt(dx * dx + dy * dy);
  }

  // info.md : surcharge de l'opérateur +
  Point operator +(Point p) => Point(x + p.x, y + p.y);
}
