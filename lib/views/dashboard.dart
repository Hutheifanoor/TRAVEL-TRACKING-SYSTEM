import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, String>> places = [
    {
      "name": "Eiffel Tower",
      "country": "FRANCE",
      "continent": "EUROPE",
      "countrycode": "FR",
      "status": "Visited",
      "image": "assets/eiffeltower.png",
    },
    {
      "name": "Great Wall",
      "country": "CHINA",
      "continent": "ASIA",
      "countrycode": "CN",
      "status": "Visited",
      "image": "assets/greatwall.png",
    },
    {
      "name": "Colosseum",
      "country": "ITALY",
      "continent": "EUROPE",
      "countrycode": "IT",
      "status": "Bucket",
      "image": "assets/colosseum.png",
    },
    {
      "name": "Statue of Liberty",
      "country": "USA",
      "continent": "NORTH AMERICA",
      "countrycode": "US",
      "status": "Visited",
      "image": "assets/statueofliberty.png",
    },
    {
      "name": "Taj Mahal",
      "country": "INDIA",
      "continent": "ASIA",
      "countrycode": "IN",
      "status": "Visited",
      "image": "assets/tajmahal.png",
    },
    {
      "name": "Tokyo Tower",
      "country": "JAPAN",
      "continent": "ASIA",
      "countrycode": "JP",
      "status": "Bucket",
      "image": "assets/tokyotower.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalplaces = places.length;
    int visitedplaces = 0;
    int bucketlistplaces = 0;

    for (var place in places) {
      if (place['status'] == 'Visited') {
        visitedplaces++;
      } else {
        bucketlistplaces++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(
            onPressed: () {
              Get.toNamed("/");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      totalplaces.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      visitedplaces.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Visited',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      bucketlistplaces.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'Bucket',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Section Title
            Text(
              "All Destinations:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),

            SizedBox(height: 10),

            // List of Places - Using Container, Row, Text (from your login)
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  bool isVisited = place['status'] == 'Visited';

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            place['image']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['name'] ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                place['country'] ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isVisited
                                        ? Colors.green.shade200
                                        : Colors.blue.shade200,
                                  ),
                                ),
                                child: Text(
                                  place['status'] ?? '',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isVisited
                                        ? Colors.green.shade700
                                        : Colors.blue.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isVisited)
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 28,
                          )
                        else
                          Icon(
                            Icons.flight_takeoff,
                            color: Colors.green,
                            size: 28,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
