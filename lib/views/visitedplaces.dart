import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Visitedplaces extends StatefulWidget {
  const Visitedplaces({super.key});

  @override
  State<Visitedplaces> createState() => _VisitedplacesState();
}

class _VisitedplacesState extends State<Visitedplaces> {
  final List<Map<String, String>> visitedPlaces = [
    {
      "name": "Great Wall",
      "country": "CHINA",
      "continent": "ASIA",
      "countrycode": "CN",
      "status": "Visited Places",
      "image": "assets/greatwall.png",
    },
    {
      "name": "Statue of Liberty",
      "country": "USA",
      "continent": "NORTH AMERICA",
      "countrycode": "US",
      "status": "Visited Places",
      "image": "assets/statueofliberty.png",
    },
    {
      "name": "Taj Mahal",
      "country": "INDIA",
      "continent": "ASIA",
      "countrycode": "IN",
      "status": "Visited Places",
      "image": "assets/tajmahal.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalVisited = visitedPlaces.length;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent[300],
      appBar: AppBar(
        title: Text("VISITED PLACES"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      totalVisited.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VISITED',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 30,
                      color: Colors.green,
                    ),
                    Text(
                      'ACHIEVED',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              "MY VISITED PLACES:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: visitedPlaces.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.explore_outlined,
                            size: 80,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No places visited yet!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Start your adventure today!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: visitedPlaces.length,
                      itemBuilder: (context, index) {
                        final place = visitedPlaces[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.deepOrange[100]!),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  place['image']!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place['name'] ?? '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      place['country'] ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    // Status Badge - Green for visited
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.green),
                                      ),
                                      child: Text(
                                        place['status'] ?? '',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.black,
                                size: 28,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WANT TO ADD MORE PLACES? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Add Place screen
                    Get.toNamed("/addplace");
                  },
                  child: Text(
                    "Add Destination",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
