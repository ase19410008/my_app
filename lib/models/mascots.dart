import 'package:flutter/material.dart';

import 'mascot.dart';

class Mascots with ChangeNotifier {
  // var _showFavOnly = false;

  final List<Mascot> _items = [
    Mascot(
      id: 0,
      name: "Duke",
      serviceName: "Java",
      imageUrl: "assets/images/pic0.png",
    ),
    Mascot(
      id: 1,
      name: "elePHPPant",
      serviceName: "PHP",
      imageUrl: "assets/images/pic1.png",
    ),
    Mascot(
      id: 2,
      name: "gopher",
      serviceName: "Go",
      imageUrl: "assets/images/pic2.png",
    ),
    Mascot(
      id: 3,
      name: "Moby Dock",
      serviceName: "Docker",
      imageUrl: "assets/images/pic3.png",
    ),
    Mascot(
      id: 4,
      name: "octocat",
      serviceName: "GitHub",
      imageUrl: "assets/images/pic4.png",
    ),
    Mascot(
      id: 5,
      name: "Tax",
      serviceName: "Linux",
      imageUrl: "assets/images/pic5.png",
    ),
    Mascot(
      id: 6,
      name: "Wilber",
      serviceName: "GIMP",
      imageUrl: "assets/images/pic6.png",
    ),
    Mascot(
      id: 6,
      name: "Dash",
      serviceName: "Dart",
      imageUrl: "assets/images/pic7.png",
    ),
  ];

  List<Mascot> get items {
    return [..._items];
  }

  List<String> get name {
    return _items.map((e) => e.name).toList();
  }

  List<Mascot> get favItems {
    return _items.where((i) => i.isFav).toList();
  }

  void addMascot() {
    notifyListeners();
  }
}
