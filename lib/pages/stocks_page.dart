import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/card_chart_builder_widget.dart';
import 'package:flutter_application_2/price_points_fixed.dart';
import 'package:google_fonts/google_fonts.dart';

class StocksPage extends StatefulWidget {
  final String stockName;
  const StocksPage({Key? key, required this.stockName}) : super(key: key);
  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  final database = FirebaseDatabase.instance.ref();
  String myText = '';
  late StreamSubscription clientStream;
  late List<ListTile> tilesList = <ListTile>[];

  List<FlSpot> myPoints_test = [];
  double meanPrice = 0.0;
  double i = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0E1117),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'BINANCE:BTCUSDT',
          style: TextStyle(
            color: Colors.blueGrey.shade200,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 50),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              from: 60,
              child: StreamBuilder(
                stream: database
                    .child('Stocks')
                    .child(widget.stockName)
                    .limitToLast(10)
                    .orderByChild('t')
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  double meanPrice = 0;
                  if (snapshot.hasData) {
                    // if (myPoints_test.length > 50) {
                    //   myPoints_test.removeRange(0, myPoints_test.length - 50);
                    // }
                    try {
                      final myData = Map<String, dynamic>.from(
                          snapshot.data!.snapshot.value);
                      double sum = 0;
                      int j = 0;
                      myData.forEach((key, value) {
                        if (myPoints_test.length > 100) {
                          myPoints_test.removeAt(0);
                        }
                        myPoints_test.add(FlSpot(i, value['p']));
                        i++;
                        j++;
                        sum += value['p'];
                      });
                      meanPrice = ((sum / j) * 100).round() / 100.0;
                    } catch (e) {
                      print(e.toString());
                    }

                    // myPoints_test.addAll(pricePointsFromJson(myData)
                    //     .map((e) => FlSpot(e.x, e.y))
                    //     .toList());

                  }
                  return Column(
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        from: 30,
                        child: Text(
                          '\$ $meanPrice',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.blueGrey.shade100,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // FadeInUp(
                      //   duration: const Duration(milliseconds: 1000),
                      //   from: 30,
                      //    child: const Text(
                      //      '+1.5%',
                      //      style: TextStyle(
                      //        fontSize: 18,
                      //        color: Colors.green,
                      //        fontWeight: FontWeight.bold,
                      //      ),
                      //    ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: CardChartBuilderWidget.buildLineChart(
                            myPoints_test, context, true),
                      ),
                    ],
                  );
                },
              ),
              // SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     child: CardChartBuilderWidget.buildLineChart(
              //         myPoints, context, true)),
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == 0
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "D",
                          style: TextStyle(
                              color: _currentIndex == 0
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == 1
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "M",
                          style: TextStyle(
                              color: _currentIndex == 1
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == 2
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "Y",
                          style: TextStyle(
                              color: _currentIndex == 2
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
