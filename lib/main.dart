import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/auth/guest_or_registered.dart';
import 'package:flutter_application_2/pages/root_page.dart';
import 'package:flutter_application_2/pages/no_internet_page.dart';
import 'package:flutter_application_2/themes/my_themes.dart';

// void main(List<String> args) async {
//   bool isInternetConnected = await Connection.isInternetConnected()
//       .timeout(const Duration(seconds: 3));
//   if (isInternetConnected) {
//     await Connection.startConnection();
//   }
//   runApp(UnifiedApp(
//     isConnected: isInternetConnected,
//   ));
// }
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UnifiedApp(isConnected: true));
  // runApp(const TestApp());
}

//todo: add start_connection also to mainrootpage
final navigatorKey = GlobalKey<NavigatorState>();
const String mainTitle = 'ITU Stock Predection';

//only for testing no internet page
//TODO delete this class
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: MyThemes.myDark(), home: const NoInternetPage());
  }
}

class UnifiedApp extends StatelessWidget {
  const UnifiedApp({super.key, required this.isConnected});
  final bool isConnected;

  Future<void> initState() async {
    await Connection.startConnection();
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == ConnectivityResult.none || !isConnected) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: mainTitle,
            theme: MyThemes.myDark(),
            home: const NoInternetPage(),
          );
        } else {
          return const MyApp();
        }
      },
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
      theme: MyThemes.myDark(),
      home: const MainRootPage(),
    );
  }
}

class MainRootPage extends StatefulWidget {
  const MainRootPage({super.key});
  @override
  State<MainRootPage> createState() => _MainRootPageState();
}

class _MainRootPageState extends State<MainRootPage> {
  // StreamSubscription? connection;
  // bool isoffline = false;

  // @override
  // void initState() {
  //   connection = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     // whenevery connection status is changed.
  //     if (result == ConnectivityResult.none) {
  //       //there is no any connection
  //       setState(() {
  //         isoffline = true;
  //       });
  //     } else {
  //       setState(() {
  //         isoffline = false;
  //       });
  //     }
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   connection?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return
        // isoffline
        //     ? const NoInternetPage()
        //     :
        Scaffold(
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
            return const RootPage();
          } else {
            return const GuestOrAuthPage();
          }
        }),
      ),
    );
  }
}
//todo: handle no network