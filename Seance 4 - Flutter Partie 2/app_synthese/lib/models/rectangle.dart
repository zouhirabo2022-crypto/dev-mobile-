import 'point.dart';
import 'shape.dart';

// Reproduit rectangle.model.dart du support (basé sur 2 points, comme Circle).
class Rectangle extends Shape {
  Rectangle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getWidth() => (p1.x - p2.x).abs();
  double getHeight() => (p1.y - p2.y).abs();

  @override
  double getArea() => getWidth() * getHeight();

  @override
  double getPerimeter() => 2 * (getWidth() + getHeight());

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'Rectangle',
      'x': p1.x,
      'y': p1.y,
      'width': getWidth(),
      'height': getHeight(),
    };
  }
}

// Exemple 3 du support (info.md) : version simple (longueur/largeur entiers),
// indépendante du modèle géométrique ci-dessus.
class RectangleSimple {
  int longueur;
  int largeur;

  RectangleSimple(this.longueur, this.largeur);

  int surface() => longueur * largeur;
  int perimetre() => 2 * (longueur + largeur);
}
