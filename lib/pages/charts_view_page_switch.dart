import 'package:flutter/material.dart';
import 'package:flutter_application_2/charts/bar_chart.dart';
import 'package:flutter_application_2/charts/line_chart.dart';
import 'package:flutter_application_2/price_points_fixed.dart';

class ChartsWidgetCopy extends StatefulWidget {
  const ChartsWidgetCopy({super.key});

  @override
  State<ChartsWidgetCopy> createState() => _ChartsWidgetCopyState();
}

class _ChartsWidgetCopyState extends State<ChartsWidgetCopy> {
  bool isLine = true;
  List<Widget> myChartsList = [
    LineChartWidget(pricePoints),
    BarChartWidget(pricePoints),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markets'),
        toolbarHeight: 40,
        foregroundColor: Colors.blue.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Builder(
                  builder: ((context) => isLine
                      ? LineChartWidget(pricePoints)
                      : BarChartWidget(pricePoints)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bar chart',
                  style: TextStyle(
                      color: isLine ? Colors.red : Colors.green, fontSize: 13),
                ),
                Switch(
                  value: isLine,
                  onChanged: (value) => setState(() {
                    isLine = !isLine;
                  }),
                ),
                Text(
                  'Line chart',
                  style: TextStyle(
                      color: isLine ? Colors.green : Colors.red, fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: AspectRatio(
                aspectRatio: 2,
                child: Builder(
                  builder: ((context) => LineChartWidget(pricePoints)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
