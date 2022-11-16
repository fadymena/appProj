import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/price_points_fixed.dart';

class CardChartBuilderWidget {
  static Widget buildLineCard(
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
                  builder: ((context) => buildLineChart(
                      p!.map((e) => FlSpot(e.x, e.y)).toList(),
                      context,
                      false)),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            stdName ? const Text('name of this stock thing') : Text(name!),
            const SizedBox(
              height: 5,
            ),
            stdValue ? const Text('value') : Text('$value'),
          ],
        ),
      ),
    );
  }

  static LineChartData mainData(List<FlSpot> myPoints, bool lineTouch) {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: false, horizontalInterval: 1.6, drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 1,
        )),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
          interval: 1,
        )),
      ),
      lineTouchData: LineTouchData(
        enabled: lineTouch,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${(touchedSpot.y * 100).round() / 100.0}',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: myPoints,
          isCurved: true,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        )
      ],
    );
  }

  static Widget buildLineChart(
      List<FlSpot> myPoints, BuildContext context, bool lineTouch) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: LineChart(
        mainData(myPoints, lineTouch),
        swapAnimationCurve: Curves.easeInOutCubic,
        swapAnimationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
