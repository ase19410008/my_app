import 'package:flutter/foundation.dart';

class Mascot with ChangeNotifier {
  final String name;
  final String serviceName;
  final String imageUrl;
  bool isFav;

  Mascot({
    required this.name,
    required this.serviceName,
    required this.imageUrl,
    this.isFav = false,
  });

  void toggleFavoriteStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
