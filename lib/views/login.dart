import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Bucket List app"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("WHATSAPP.png", width: 200, height: 200)],
            ),
            Text(
              "USERNAME:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "PASSWORD:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/home");
                  },
                  color: Colors.deepOrange,
                  height: 50,
                  minWidth: 200,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontWeight: .bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    "Not registerd? Sign Up",
                    style: TextStyle(color: Colors.black, fontWeight: .bold),
                  ),
                  onTap: () {
                    //code to navigate to SINGUP page
                    Get.toNamed("/signup");
                  },
                ),
                Spacer(),
                Text(
                  "Forgot Password? Reset",
                  style: TextStyle(color: Colors.black, fontWeight: .bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
