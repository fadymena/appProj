// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/charts_view_page.dart';
import 'package:flutter_application_2/pages/charts_view_page_switch.dart';
import 'package:flutter_application_2/pages/learn_flutter.dart';
import 'package:flutter_application_2/pages/new_home_widget.dart';
import 'package:flutter_application_2/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    const FullHomeWidget(),
    const ChartsWidgetCopy(),
    //const ChartsViewPage(),
    ProfilePage(),
  ];
  final user = FirebaseAuth.instance.currentUser!;
  final Connection connection = Connection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        height: 45,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_stream_rounded),
            label: '',
          ),
          /*NavigationDestination(
              icon: Icon(Icons.functions_rounded), label: 'functions',),*/
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
