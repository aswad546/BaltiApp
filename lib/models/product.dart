import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String businessId;
  final String description;
  final double price;
  final double rating;
  final double duration;
  final String imageUrl;
  final List<dynamic> images;
  final List<dynamic> videos;
  bool isFav;

  Product({
    required this.id,
    required this.name,
    required this.businessId,
    required this.description,
    required this.price,
    required this.rating,
    required this.duration,
    required this.imageUrl,
    required this.images,
    required this.videos,
    this.isFav = false,
  });

  Future<void> toggleFavorite(String id) async {
    isFav = !isFav;
    notifyListeners();
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      businessId: json['business_id'],
      description: json['description'],
      price: json['price']!=null?json['price'].toDouble():0,
      duration: json['duration']!=null?json['duration'].toDouble():0,
      imageUrl:
          "assets/images/subway.png", // hardcoded for now, to be changed when backend is fixed
      rating: json['rating']!=null?json['rating'].toDouble():0,
      images: json['images'],
      videos: json['videos'],
    );
  }

  // static Map<String, dynamic> Product.toJson (Product p) {
    
  // };
}
