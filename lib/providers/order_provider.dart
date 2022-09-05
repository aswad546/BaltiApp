import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/order.dart';
import '../models/product.dart';

class Orders with ChangeNotifier {
  final String authToken;
  final String userId;
  Orders({
    required this.authToken,
    required this.orders,
    required this.orderItems,
    required this.userId,
  });
  List<Order> orders = [];
  List<CartItem> orderItems = [];

  List<CartItem> get getOrderItems {
    return [...orderItems];
  }

  Future<String> createOrder(String userId) async {
    //Send Api call to server for add
    // create new cart item with current cart id
    return "cart id";
    notifyListeners();
  }

  Future<void> getOrderById(String id) async {
    //Send Api call to server for add
    // create new cart item with current cart id
    orderItems = [];
    final response = await http.get(
        Uri.parse('https://balti-api.herokuapp.com/api/businesses/list/$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i = i + 1) {
        print("********************");
        print(jsonResponse[i]);
        orders.add(Order.fromJson(jsonResponse[i]));
      }
      // return businesses.firstWhere((bus) => bus.id == id);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

  Future<void> getOrder() async {
    //Send Api call to server for add
    // create new cart item with current cart id
    orderItems = [];
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
