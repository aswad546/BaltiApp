import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class Cart with ChangeNotifier {
  List<Product> cartProducts = [];

  List<Product> get getCartProducts {
    return [...cartProducts];
  }

  Future<String> createCart(String userId) async {
    //Send Api call to server for add
    // create new cart item with current cart id
    return "cart id";
    notifyListeners();
  }

  Future<void> getProducts() async {
    //Send Api call to server for add
    // create new cart item with current cart id
    cartProducts = [
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
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    //Send Api call to server for add
    // create new cart item with current cart id
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    //Send Api call to server for delete
    // delete cart item with cart item id
    notifyListeners();
  }
}
