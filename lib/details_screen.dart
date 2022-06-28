import 'package:flutter/material.dart';
import 'package:my_app/models/mascot.dart';
import 'package:my_app/models/mascots.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.index});

  final int index;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/images/pic${widget.index}.png",
          ),
          // Text('hoge'),
        ],
      )),
    );
  }
}
