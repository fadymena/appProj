import 'package:flutter/material.dart';
import 'package:flutter_application_2/charts/line_chart.dart';
import 'package:flutter_application_2/price_points.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: LineChartWidget(pricePoints),
              ),
              /*ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LearnFlutter();
                      },
                    ),
                  );
                },
                child: const Text('learn flutter'),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
