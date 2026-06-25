import 'dart:convert';
import 'shape.dart';

// Reproduit GeometricDesign du diagramme de classes (page 13 du support) :
// un agrégat de Shape, sérialisable en JSON via dart:convert (Partie 3).
class GeometricDesign {
  List<Shape> shapes = [];

  void add(Shape sh) => shapes.add(sh);

  void showShapes() {
    for (var sh in shapes) {
      print(sh.toJson());
    }
  }

  String toJsonString() => jsonEncode(shapes.map((s) => s.toJson()).toList());
}
