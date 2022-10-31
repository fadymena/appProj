import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/charts/line_chart.dart';
import 'package:flutter_application_2/pages/bar_chart_page.dart';
import 'package:flutter_application_2/pages/charts_view_page_switch.dart';
import 'package:flutter_application_2/price_points.dart';

import 'line_chart_page.dart';

class FullHomeWidget extends StatefulWidget {
  const FullHomeWidget({super.key});

  @override
  State<FullHomeWidget> createState() => _FullHomeWidgetState();
}

class _FullHomeWidgetState extends State<FullHomeWidget> {
  static const double width = 10.0;
  static const double height = 20.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => print('card 1 taped'),
                    child: buildLineCard('one', 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 2 taped'),
                    child: buildLineCard('two', 50, pricePoints, false),
                  ),
                  GestureDetector(
                    onTap: () => print('card 3 taped'),
                    child: buildLineCard(null, 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 4 taped'),
                    child: buildLineCard('three', 50, pricePoints, false),
                  ),
                  GestureDetector(
                    onTap: () => print('card 5 taped'),
                    child: buildLineCard(null, 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 6 taped'),
                    child: buildLineCard('four', 50, pricePoints, false),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: height,
            ),
            const Text(
              'Create your watchlist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Follow the titles to recive relative news, sugestions and predections',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: height,
            ),
            Row(
              children: const [],
            ),
            Row(
              children: const [],
            ),
            const ListTile()
          ],
        ),
      ),
    );
  }

  Widget buildLineChart(List<PricePoint>? p) {
    List<PricePoint> localP;
    if (p == null) {
      localP = pricePoints;
    } else {
      localP = p;
    }
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: localP.map((e) => FlSpot(e.x, e.y)).toList(),
            dotData: FlDotData(show: false),
            isCurved: true,
            color: Colors.blue,
            barWidth: 1,
            preventCurveOverShooting: true,
          ),
          LineChartBarData(
            spots: localP.map((e) => FlSpot(e.x, e.y / -4)).toList(),
            dotData: FlDotData(show: false),
            isCurved: true,
            color: Colors.red,
            barWidth: 1,
            preventCurveOverShooting: true,
          ),
        ],
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        //backgroundColor: Colors.green[100],
      ),
    );
  }

  Widget buildLineCard(
      String? name, double? value, List<PricePoint>? p, bool elev) {
    bool stdName = false;

    bool stdValue = false;
    if (name == null) {
      stdName = true;
    }
    if (value == null) {
      stdValue = true;
    }

    return Card(
      margin: const EdgeInsets.all(5),
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(25, 0, 140, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: AspectRatio(
                aspectRatio: 2,
                child: Builder(
                  builder: ((context) => buildLineChart(p)),
                ),
              ),
            ),
            stdName ? const Text('name of this stock thing') : Text(name!),
            stdValue ? const Text('value') : Text('$value'),
          ],
        ),
      ),
    );
  }
}
