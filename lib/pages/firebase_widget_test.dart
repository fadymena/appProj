import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/charts/line_chart.dart';
import 'package:flutter_application_2/price_points_fixed.dart';

class FirebaseQueryTest extends StatefulWidget {
  const FirebaseQueryTest({super.key});

  @override
  State<FirebaseQueryTest> createState() => _FirebaseQueryTestState();
}

class _FirebaseQueryTestState extends State<FirebaseQueryTest> {
  final database = FirebaseDatabase.instance.ref();
  String myText = '';
  late StreamSubscription clientStream;
  late List<ListTile> tilesList = <ListTile>[];
  late List<double> myPointsY = [];

  @override
  void initState() {
    activateListeners();
    super.initState();
  }

  void activateListeners() {
    clientStream = database
        .child('Stocks')
        .child('BINANCE:BTCUSDT')
        .limitToLast(25)
        .onValue
        .listen((event) {
      final data = (event.snapshot.value) as Map<String, dynamic>;
      List listOrders = [];
      data.forEach((key, value) {
        listOrders.add(value);
      });
      List timeStamp = [];
      List prices = [];
      final lTList = <ListTile>[];
      for (var element in listOrders) {
        timeStamp.add(element['t']);
        prices.add(element['p']);
        if (myPointsY.length > 30) {
          myPointsY.removeAt(0);
        }
        myPointsY.add(element['p']);
        print(timeStamp.last);
        print(prices.last);

        lTList.add(
          ListTile(
            title: Text(
              timeStamp.last.toString(),
            ),
            subtitle: Text(
              prices.last.toString(),
            ),
          ),
        );
      }
      setState(() {
        tilesList = lTList;
      });
      // final client = clients[0] as String;
      // final price = prices[0] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockRef = database.child('orders');

    return Scaffold(
      body: Column(
        children: [
          const Text('hi'),
          ElevatedButton(
              onPressed: (() {
                final nextOrder = {
                  'disc': 'latte',
                  'price': Random().nextInt(20).toDouble(),
                  'client': 'fady',
                };
                stockRef.push().set(nextOrder);
              }),
              child: const Text('simple set')),
          Expanded(
            child: ListView(
              children: tilesList,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChartWidget(pricePointsFromList(myPointsY)),
            ),
          )
        ],
      ),
    );
    // TODO: use the video to set and get data from realdatabase and set them into a chart_line_widget
  }

  @override
  void deactivate() {
    clientStream.cancel();
    super.deactivate();
  }
}
