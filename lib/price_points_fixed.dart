import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  final data = <double>[
    2,
    4,
    6,
    11,
    3,
    6,
    4,
    5,
    7,
    9,
    13,
    5,
    56,
    48,
    2,
    2,
    43,
    3,
    -4,
    -5
  ];
  return data
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}

List<PricePoint> pricePointsFromList(List<double> points) {
  return points
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}

List<PricePoint> pricePointsFromJson(Map<String, dynamic> data) {
  List<double> points = [];
  data.forEach((key, value) {
    points.add(value['p']);
  });
  return points
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}
