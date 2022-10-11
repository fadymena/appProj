import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/bar_chart_page.dart';
import 'package:flutter_application_2/pages/line_chart_page.dart';

class ChartsWidgetCopy extends StatefulWidget {
  const ChartsWidgetCopy({super.key});

  @override
  State<ChartsWidgetCopy> createState() => _ChartsWidgetCopyState();
}

class _ChartsWidgetCopyState extends State<ChartsWidgetCopy> {
  bool isLine = true;
  List<Widget> myChartsList = [const LineChartPage(), const BarChartPage()];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 2,
            child: Builder(
              builder: ((context) =>
                  isLine ? const LineChartPage() : const BarChartPage()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bar chart',
                style: TextStyle(
                    color: isLine ? Colors.red : Colors.green,
                    fontSize: isLine ? 10 : 15),
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
                    color: isLine ? Colors.green : Colors.red,
                    fontSize: isLine ? 15 : 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
