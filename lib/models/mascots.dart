import 'package:flutter/material.dart';

import 'mascot.dart';

class Mascots with ChangeNotifier {
  var _showFavOnly = false;

  final List<Mascot> _items = [
    Mascot(
      name: "Duke",
      serviceName: "Java",
      imageUrl: "assets/images/pic0.png",
    ),
    Mascot(
      name: "elePHPPant",
      serviceName: "PHP",
      imageUrl: "assets/images/pic1.png",
    ),
    Mascot(
      name: "gopher",
      serviceName: "Go",
      imageUrl: "assets/images/pic2.png",
    ),
    Mascot(
      name: "Moby Dock",
      serviceName: "Docker",
      imageUrl: "assets/images/pic3.png",
    ),
    Mascot(
      name: "octocat",
      serviceName: "GitHub",
      imageUrl: "assets/images/pic4.png",
    ),
    Mascot(
      name: "Tax",
      serviceName: "Linuxa",
      imageUrl: "assets/images/pic5.png",
    ),
    Mascot(
      name: "Wilber",
      serviceName: "GINP",
      imageUrl: "assets/images/pic6.png",
    ),
    Mascot(
      name: "Dash",
      serviceName: "Dart",
      imageUrl: "assets/images/pic7.png",
    ),
  ];

  List<Mascot> get items {
    return [..._items];
  }

  List<Mascot> get favItems {
    return _items.where((i) => i.isFav).toList();
  }

  void addMascot() {
    notifyListeners();
  }
}
