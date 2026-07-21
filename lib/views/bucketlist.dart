import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Bucketlist extends StatefulWidget {
  const Bucketlist({super.key});

  @override
  State<Bucketlist> createState() => _BucketlistState();
}

class _BucketlistState extends State<Bucketlist> {
  final List<Map<String, String>> bucketPlaces = [
    {
      "name": "Eiffel Tower",
      "country": "FRANCE",
      "continent": "EUROPE",
      "countrycode": "FR",
      "status": "Bucket List",
      "image": "assets/eiffeltower.png",
    },
    {
      "name": "Colosseum",
      "country": "ITALY",
      "continent": "EUROPE",
      "countrycode": "IT",
      "status": "Bucket List",
      "image": "assets/colosseum.png",
    },
    {
      "name": "Tokyo Tower",
      "country": "JAPAN",
      "continent": "ASIA",
      "countrycode": "JP",
      "status": "Bucket List",
      "image": "assets/tokyotower.png",
    },
  ];
  Widget build(BuildContext context) {
    int totalBucket = bucketPlaces.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("BUCKET LIST"),
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
                      totalBucket.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'BUCKET LIST',
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
                    Icon(Icons.star, size: 30, color: Colors.blue),
                    Text(
                      'DREAM',
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
              "MY BUCKET LIST",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: bucketPlaces.isEmpty
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
                            'No places in bucket list!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Add your dream destinations',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: bucketPlaces.length,
                      itemBuilder: (context, index) {
                        final place = bucketPlaces[index];

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
                                    // Status Badge - Blue for Bucket
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: Text(
                                        place['status'] ?? '',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.flight_takeoff,
                                color: Colors.black,
                                size: 28,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WANT TO FILL YOUR BUCKET LIST?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //code to navigate to ADDPLACE page
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
