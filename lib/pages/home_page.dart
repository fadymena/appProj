// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/charts_view_page.dart';
import 'package:flutter_application_2/pages/charts_view_page_switch.dart';
import 'package:flutter_application_2/pages/learn_flutter.dart';
import 'package:flutter_application_2/pages/sign_in_widget.dart';
import 'package:flutter_application_2/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    const ChartsWidgetCopy(),
    const ChartsViewPage(),
    ProfilePage(),
  ];
  final user = FirebaseAuth.instance.currentUser!;
  final Connection connection = Connection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.functions_rounded), label: 'functions'),
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
        height: 55,
      ),
    );
  }
}
