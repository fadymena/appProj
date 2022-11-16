import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/card_chart_builder_widget.dart';
import 'package:flutter_application_2/pages/stocks_page.dart';
import 'package:flutter_application_2/price_points_fixed.dart';
import 'package:flutter_application_2/utils/my_consts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final myConst = MyConsts();
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
                    onTap: (() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Scaffold(
                                body: StocksPage(stockName: 'BINANCE:BTCUSDT'));
                          }),
                        ),
                      );
                    }),
                    child: CardChartBuilderWidget.buildLineCard(
                        'BINANCE:BTCUSDT', 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 2 taped'),
                    child: CardChartBuilderWidget.buildLineCard(
                        'two', 50, pricePoints, false),
                  ),
                  GestureDetector(
                    onTap: () => print('card 3 taped'),
                    child: CardChartBuilderWidget.buildLineCard(
                        null, 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 4 taped'),
                    child: CardChartBuilderWidget.buildLineCard(
                        'three', 50, pricePoints, false),
                  ),
                  GestureDetector(
                    onTap: () => print('card 5 taped'),
                    child: CardChartBuilderWidget.buildLineCard(
                        null, 50, pricePoints, true),
                  ),
                  GestureDetector(
                    onTap: () => print('card 6 taped'),
                    child: CardChartBuilderWidget.buildLineCard(
                        'four', 50, pricePoints, false),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyConsts().boxHspace,
            ),
            Text(
              'Create your watchlist',
              style: TextStyle(
                fontSize: MyConsts().bigTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade100,
              ),
            ),
            Text(
              'Follow the titles to recive relative news, sugestions and predections',
              style: TextStyle(
                fontSize: MyConsts().smallTextSize,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade100,
              ),
            ),
            SizedBox(
              height: MyConsts().boxHspace,
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
}
