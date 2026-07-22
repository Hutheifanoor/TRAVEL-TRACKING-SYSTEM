import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Addplace extends StatefulWidget {
  const Addplace({super.key});

  @override
  State<Addplace> createState() => _AddplaceState();
}

class _AddplaceState extends State<Addplace> {
  // ignore: non_constant_identifier_names
  final TextEditingController _NameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _CountryController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _ContinentController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _CountryCodeController = TextEditingController();

  String _status = "Bucket List"; // Default status

  final List<String> _statusOptions = ["Bucket List", "Visited Places"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DESTINATION"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(
            onPressed: () {
              Get.toNamed("/");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("WHATSAPPP.png", width: 200, height: 200)],
            ),
            SizedBox(height: 20),
            Text(
              "Place Name:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              controller: _NameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.place),
                hintText: "Enter place name",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Country:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              controller: _CountryController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag),
                hintText: "Enter country name",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Continent:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              controller: _ContinentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.public),
                hintText: "Enter continent",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Country Code:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              controller: _CountryCodeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code),
                hintText: "Enter country code (e.g., FR, US)",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Status:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            DropdownButtonFormField<String>(
              initialValue: _status,
              items: _statusOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _status = newValue ?? "Bucket List";
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.list),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${_NameController.text} added to $_status!',
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  color: Colors.deepOrange,
                  height: 50,
                  minWidth: 200,
                  child: Text(
                    "ADD PLACE",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
