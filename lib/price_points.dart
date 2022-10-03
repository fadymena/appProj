// ignore: depend_on_referenced_packages
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
    66,
    78,
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
