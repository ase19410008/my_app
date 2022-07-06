import 'package:flutter/material.dart';
import 'package:my_app/models/mascot.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.mascot});

  final Mascot mascot;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mascot.name),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset(widget.mascot.imageUrl),
        ],
      )),
    );
  }
}
