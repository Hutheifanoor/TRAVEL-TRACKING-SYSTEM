import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/addplace.dart';
import 'package:flutter_application_1/views/bucketlist.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/visitedplaces.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

var screens = [
  const Dashboard(),
  const Addplace(),
  const Bucketlist(),
  const Visitedplaces(),
];
int position = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[position],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepOrange,
        items: <Widget>[
          Icon(Icons.dashboard, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.flight_takeoff, size: 30),
          Icon(Icons.check_circle, size: 30),
        ],
        onTap: (index) {
          setState(() {
            position = index;
          });
        },
      ),
    );
  }
}
