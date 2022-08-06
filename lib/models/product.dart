import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String businessId;
  final double price;
  final double rating;
  final double duration;
  final String imageUrl;
  final List<String> images;
  bool isFav;

  Product({
    required this.id,
    required this.name,
    required this.businessId,
    required this.price,
    required this.rating,
    required this.duration,
    required this.imageUrl,
    required this.images,
    this.isFav = false,
  });

  Future<void> toggleFavorite(String id) async {
    isFav = !isFav;
    notifyListeners();
  }
}
