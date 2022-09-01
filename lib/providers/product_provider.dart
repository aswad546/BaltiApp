// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:objectid/objectid.dart';

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

  Future<void> findByBusinessId(String id) async {
    products = [];
    final response = await http.get(Uri.parse(
        'https://balti-api.herokuapp.com/api/businesses/listProducts/$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i = i + 1) {
        print("********************");
        print(jsonResponse[i]);
        products.add(Product.fromJson(jsonResponse[i]));
      }
      // return businesses.firstWhere((bus) => bus.id == id);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    notifyListeners();
    // return products.where((prod) => prod.businessId == id).toList();
  }

  Future<Product> addProduct(Product product) async {
    //Send Api call to server for add
    var bod = jsonEncode({
      "business_id": product.businessId,
      "name": product.name,
      "price": product.price,
      "description": product.description,
      // "duration": product.duration,
      // "rating": 0,
      "images": product.images,
      "videos": product.videos,
    });
    final response = await http.post(
      Uri.parse('https://balti-api.herokuapp.com/api/products'),
      headers: {"Content-Type": "application/json"},
      body: bod,
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print("Product Created");
      Product newProduct = Product.fromJson(jsonDecode(response.body));
      products.add(newProduct);
      return newProduct;
      notifyListeners();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create product.');
    }
  }

  Future<void> editProduct(Product product) async {
    //Send Api call to server for edit
    var bod = jsonEncode({
      "business_id": product.businessId,
      "name": product.name,
      "price": product.price,
      "description": product.description,
      // "duration": product.duration,
      // "rating": 0,
      "images": product.images,
      "videos": product.videos,
    });
    final response = await http.put(
      Uri.parse('https://balti-api.herokuapp.com/api/products/${product.id}'),
      headers: {"Content-Type": "application/json"},
      body: bod,
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print("Product Updated");
      notifyListeners();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create product.');
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    //Send Api call to server for delete
    final response = await http
        .delete(Uri.parse('https://balti-api.herokuapp.com/api/products/$id'));
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("Successfully deleted product");
      print(jsonDecode(response.body));
      // return jsonDecode(response.body).id;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to edit business.');
    }
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    products = [
      Product(
        id: '1',
        name: 'Burger and Fries',
        businessId: '1',
        description: 'sjskdfb fkdhfkjdhf kfh sdkfh',
        price: 550,
        rating: 4.5,
        duration: 25,
        imageUrl: 'assets/images/burger.jpg',
        images: [],
        videos: [],
      ),
      Product(
        id: '2',
        name: 'Paratha Roll',
        description: 'sjskdfb fkdhfkjdhf kfh sdkfh',
        businessId: '2',
        price: 600,
        rating: 4,
        duration: 30,
        imageUrl: 'assets/images/roll.jpg',
        images: [],
        videos: [],
      ),
      Product(
        id: '3',
        name: 'Mexican Tacos',
        description: 'sjskdfb fkdhfkjdhf kfh sdkfh',
        businessId: '1',
        price: 550,
        rating: 4.5,
        duration: 35,
        imageUrl: 'assets/images/tacos.jpg',
        images: [],
        videos: [],
      ),
      Product(
        id: '4',
        name: 'Vietnamese Noodles',
        description: 'sjskdfb fkdhfkjdhf kfh sdkfh',
        businessId: '3',
        price: 650,
        rating: 5,
        duration: 35,
        imageUrl: 'assets/images/food_1.jpeg',
        images: [],
        videos: [],
      ),
      Product(
        id: '5',
        name: 'Summer Salad',
        description: 'sjskdfb fkdhfkjdhf kfh sdkfh',
        businessId: '1',
        price: 350,
        rating: 4,
        duration: 25,
        imageUrl: 'assets/images/salad.jpg',
        images: [],
        videos: [],
      ),
    ];

    //Fetch products from api and set local products list
    notifyListeners();
  }
}
