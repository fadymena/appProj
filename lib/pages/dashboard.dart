import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/custom_widget_builder.dart';
import 'package:flutter_application_2/model/watch_list_item.dart';
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
  final listTile = <ListTile>[];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
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
                                  body:
                                      StocksPage(stockName: 'BINANCE:BTCUSDT'));
                            }),
                          ),
                        );
                      }),
                      child: CustomWidgetBuilder.buildLineCard(
                          'BINANCE:BTCUSDT', 50, pricePoints, true),
                    ),
                    GestureDetector(
                      onTap: () => print('card 2 taped'),
                      child: CustomWidgetBuilder.buildLineCard(
                          'two', 50, pricePoints, false),
                    ),
                    GestureDetector(
                      onTap: () => print('card 3 taped'),
                      child: CustomWidgetBuilder.buildLineCard(
                          null, 50, pricePoints, true),
                    ),
                    GestureDetector(
                      onTap: () => print('card 4 taped'),
                      child: CustomWidgetBuilder.buildLineCard(
                          'three', 50, pricePoints, false),
                    ),
                    GestureDetector(
                      onTap: () => print('card 5 taped'),
                      child: CustomWidgetBuilder.buildLineCard(
                          null, 50, pricePoints, true),
                    ),
                    GestureDetector(
                      onTap: () => print('card 6 taped'),
                      child: CustomWidgetBuilder.buildLineCard(
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
              Column(
                children: watchListBuilder(null),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> watchListBuilder(List<WatchlistItem>? items) {
    items ??= wListItemsDemo;
    for (var element in items!) {
      listTile.add(
        ListTile(
          title: Text(element.name),
          subtitle: Text(element.price.toString()),
          style: ListTileStyle.list,
          contentPadding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
    }
    return listTile;
  }
}
//TODO: make stream builder for watchlist
