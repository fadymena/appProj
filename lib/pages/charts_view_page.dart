import 'package:flutter/material.dart';
import 'package:flutter_application_2/charts/bar_chart.dart';
import 'package:flutter_application_2/charts/line_chart.dart';
import 'package:flutter_application_2/price_points_fixed.dart';

class ChartsViewPage extends StatelessWidget {
  const ChartsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.stacked_line_chart),
            ),
            Tab(
              icon: Icon(Icons.bar_chart),
            ),
          ]),
        ),
        backgroundColor: Colors.amber[40],
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
            child: LineChartWidget(pricePoints),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
            child: BarChartWidget(pricePoints),
          ),
        ]),
      ),
    );
  }
}
