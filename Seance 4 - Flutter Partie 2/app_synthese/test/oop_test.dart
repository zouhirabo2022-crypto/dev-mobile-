import 'package:flutter_test/flutter_test.dart';
import 'package:app_synthese/models/personne.dart';
import 'package:app_synthese/models/point.dart';
import 'package:app_synthese/models/circle.dart';
import 'package:app_synthese/models/rectangle.dart';
import 'package:app_synthese/models/geometric_design.dart';

void main() {
  group('Personne / Salarie (héritage, polymorphisme)', () {
    test('Salarie hérite de Personne et peut augmenter son salaire', () {
      Salarie s = Salarie('Bob', 35, 5000);
      expect(s.nom, 'Bob');
      expect(s, isA<Personne>());
      s.augmentation(300);
      expect(s.salaire, 5300);
    });
  });

  group('Point (constructeur nommé, opérations)', () {
    test('Point.from construit depuis une liste', () {
      final p = Point.from([2, 5]);
      expect(p.x, 2);
      expect(p.y, 5);
    });

    test('distanceTo calcule la distance euclidienne', () {
      final p1 = Point(0, 0);
      final p2 = Point(3, 4);
      expect(p1.distanceTo(p2), 5);
    });

    test('toJson / fromJson sont symétriques', () {
      final p = Point(1, 2);
      final json = p.toJson();
      final p2 = Point.fromJson(json);
      expect(p2.x, p.x);
      expect(p2.y, p.y);
    });

    test('Point.origin() crée un point (0,0)', () {
      final o = Point.origin();
      expect(o.x, 0);
      expect(o.y, 0);
    });

    test('operator + additionne deux points', () {
      final p1 = Point(2, 3);
      final p2 = Point(1, 4);
      final p3 = p1 + p2;
      expect(p3.x, 3);
      expect(p3.y, 7);
    });
  });

  group('Circle / Rectangle (héritage de Shape)', () {
    test('Circle calcule rayon, aire et périmètre', () {
      final c = Circle(p1: Point(0, 0), p2: Point(3, 0));
      expect(c.getRadius(), 3);
      expect(c.getArea(), closeTo(28.27, 0.01));
      expect(c.getPerimeter(), closeTo(18.85, 0.01));
    });

    test('Rectangle calcule largeur, hauteur, aire et périmètre', () {
      final r = Rectangle(p1: Point(0, 0), p2: Point(4, 2));
      expect(r.getWidth(), 4);
      expect(r.getHeight(), 2);
      expect(r.getArea(), 8);
      expect(r.getPerimeter(), 12);
    });

    test('RectangleSimple (exemple info.md) calcule surface et périmètre',
        () {
      final r = RectangleSimple(10, 5);
      expect(r.surface(), 50);
      expect(r.perimetre(), 30);
    });
  });

  group('GeometricDesign (agrégat polymorphe)', () {
    test('add() accepte Circle et Rectangle et sérialise en JSON', () {
      final design = GeometricDesign();
      design.add(Circle(p1: Point(0, 0), p2: Point(1, 0)));
      design.add(Rectangle(p1: Point(0, 0), p2: Point(2, 2)));
      expect(design.shapes.length, 2);
      final jsonStr = design.toJsonString();
      expect(jsonStr, contains('Circle'));
      expect(jsonStr, contains('Rectangle'));
    });
  });
}
