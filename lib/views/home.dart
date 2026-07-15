import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/addplace.dart';
import 'package:flutter_application_1/views/bucketlist.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/visitedplaces.dart';

var screens = [
  const Addplace(),
  const Bucketlist(),
  const Visitedplaces(),
  const Dashboard(),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.dashboard, size: 30),
        ],
        onTap: (index) {
          setState(() {
            position = index;
          });
        },
      ),
      body: screens[position],
    );
  }
}
