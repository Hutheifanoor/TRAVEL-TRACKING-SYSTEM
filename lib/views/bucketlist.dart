import 'package:flutter/material.dart';

class Bucketlist extends StatefulWidget {
  const Bucketlist({super.key});

  @override
  State<Bucketlist> createState() => _BucketlistState();
}

class _BucketlistState extends State<Bucketlist> {
  @override
  Widget build(BuildContext context) {
    return const Text("Bucket List");
  }
}
