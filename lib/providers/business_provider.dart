// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

import '../models/business.dart';

class Businesses with ChangeNotifier {
  final String authToken;
  final String userId;
  Businesses({
    required this.authToken,
    required this.businesses,
    required this.userId,
  });

  List<Business> businesses = [];

  List<Business> get getBusinesses {
    return [...businesses];
  }

  Business findById(String id) {
    return businesses.firstWhere((bus) => bus.id == id);
  }

  Future<void> addProduct(Business business) async {
    //Send Api call to server for add
    businesses.add(business);
    notifyListeners();
  }

  Future<void> editProduct(Business business) async {
    //Send Api call to server for edit
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    //Send Api call to server for delete
    notifyListeners();
  }

  Future<void> fetchAndSetBusinesses() async {
    businesses = [
      Business(
        id: '2',
        ownerId: '2',
        name: 'Arcadian Cafe',
        type: 'Restaurant',
        lat: 12.01,
        lng: 22.1,
        description: 'Finest dining in the city',
        imageUrl: 'assets/images/arcadian.jpg',
        rating: 4.5,
      ),
      Business(
        id: '1',
        ownerId: '2',
        name: 'Subway',
        type: 'Restaurant',
        lat: 10.01,
        lng: 20.1,
        description: 'Find the best sandwiches in the city',
        imageUrl: 'assets/images/subway.png',
        rating: 4.0,
      ),
    ];
    //Fetch products from api and set local products list
    notifyListeners();
  }
}
