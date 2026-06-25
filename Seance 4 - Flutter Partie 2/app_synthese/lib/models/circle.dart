import 'dart:math';
import 'shape.dart';
import 'point.dart';

// Reproduit circle.model.dart du support.
class Circle extends Shape {
  Circle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getRadius() => p1.distanceTo(p2);

  @override
  double getArea() {
    double radius = getRadius();
    return pi * pow(radius, 2);
  }

  @override
  double getPerimeter() {
    double radius = getRadius();
    return 2 * pi * radius;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'Circle',
      'center': p1.toJson(),
      'radius': getRadius(),
    };
  }
}
