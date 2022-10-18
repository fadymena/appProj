import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/auth/guest_or_registered.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/no_internet_page.dart';

void main(List<String> args) async {
  Connection connection = Connection();
  var isInternetConnected = connection.isInternetConnected();
  if (await isInternetConnected) {
    await connection.startConnection();
  }
  connection.isDbConnected()
      ? runApp(const MyApp())
      : runApp(const MyAppNoInternet());
}

final navigatorKey = GlobalKey<NavigatorState>();
const String mainTitle = 'ITU Stock Predection';

class MyAppNoInternet extends StatelessWidget {
  const MyAppNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainTitle,
      theme: ThemeData.dark(),
      home: const NoInternetPage(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //final databaseReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: mainTitle,
      theme: ThemeData.dark(),
      home: const RootPage(title: 'Flutter Demo main title'),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.title});
  final String title;
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  StreamSubscription? connection;
  bool isoffline = false;

  @override
  void initState() {
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      } else {
        setState(() {
          isoffline = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isoffline
        ? const NoInternetPage()
        : Scaffold(
            body: StreamBuilder<dynamic>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Somthing went wrong!'),
                  );
                } else if (snapshot.hasData) {
                  //return const HomePage();
                  return const HomePage();
                } else {
                  return const GuestOrAuthPage();
                }
              }),
            ),
          );
  }
}
