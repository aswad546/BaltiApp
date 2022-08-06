// ignore: file_names
import 'package:flutter/foundation.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final String authToken;
  final String userId;
  Products({
    required this.authToken,
    required this.products,
    required this.userId,
  });

  List<Product> products = [];

  List<Product> get getProducts {
    return [...products];
  }

  List<Product> get favoriteProducts {
    return products.where((prod) => prod.isFav).toList();
  }

  Product findById(String id) {
    return products.firstWhere((prod) => prod.id == id);
  }

  List<Product> findByBusinessId(String id) {
    return products.where((prod) => prod.businessId == id).toList();
  }

  Future<void> addProduct(Product product) async {
    //Send Api call to server for add
    products.add(product);
    notifyListeners();
  }

  Future<void> editProduct(Product product) async {
    //Send Api call to server for edit
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    //Send Api call to server for delete
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    products = [
      Product(
        id: '1',
        name: 'Burger and Fries',
        businessId: '1',
        price: 550,
        rating: 4.5,
        duration: 25,
        imageUrl: 'assets/images/burger.jpg',
        images: [],
      ),
      Product(
        id: '2',
        name: 'Paratha Roll',
        businessId: '2',
        price: 600,
        rating: 4,
        duration: 30,
        imageUrl: 'assets/images/roll.jpg',
        images: [],
      ),
      Product(
        id: '3',
        name: 'Mexican Tacos',
        businessId: '1',
        price: 550,
        rating: 4.5,
        duration: 35,
        imageUrl: 'assets/images/tacos.jpg',
        images: [],
      ),
      Product(
        id: '4',
        name: 'Vietnamese Noodles',
        businessId: '3',
        price: 650,
        rating: 5,
        duration: 35,
        imageUrl: 'assets/images/food_1.jpeg',
        images: [],
      ),
      Product(
        id: '5',
        name: 'Summer Salad',
        businessId: '1',
        price: 350,
        rating: 4,
        duration: 25,
        imageUrl: 'assets/images/salad.jpg',
        images: [],
      ),
    ];

    //Fetch products from api and set local products list
    notifyListeners();
  }
}
