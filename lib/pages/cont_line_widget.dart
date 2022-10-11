import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/bar_chart_page.dart';
import 'package:flutter_application_2/pages/line_chart_page.dart';

class ContLineWidget extends StatelessWidget {
  const ContLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const LineChartPage(),
    );
  }
}
