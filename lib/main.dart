import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(TravelBucketlistApp());
}

class TravelBucketlistApp extends StatefulWidget {
  const TravelBucketlistApp({super.key});

  @override
  State<TravelBucketlistApp> createState() => _TravelBucketlistAppState();
}

class _TravelBucketlistAppState extends State<TravelBucketlistApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginscreen(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
