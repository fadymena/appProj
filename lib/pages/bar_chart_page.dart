import 'package:flutter/material.dart';
import 'package:flutter_application_2/price_points.dart';
import 'package:flutter_application_2/charts/bar_chart.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: BarChartWidget(pricePoints),
            ),
          ],
        ),
      ),
    ));
  }
}
