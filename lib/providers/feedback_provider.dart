// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/feedback_item.dart';

class FeedbackItems with ChangeNotifier {
  final String authToken;
  final String userId;

  FeedbackItems({
    required this.authToken,
    required this.businessFeedback,
    required this.productFeedback,
    required this.userId,
  });

  List<FeedbackItem> businessFeedback = [];

  List<FeedbackItem> productFeedback = [];

  List<FeedbackItem> get getBusinessFeedback {
    return [...businessFeedback];
  }

  List<FeedbackItem> get getProductFeedback {
    return [...productFeedback];
  }

  Future<void> addFeedbackItem(FeedbackItem feedbackItem) async {
    //Send Api call to server for add
    // feedbackItem.add(feedbackItem);
    notifyListeners();
  }

  Future<void> editFeedbackItem(FeedbackItem feedbackItem) async {
    //Send Api call to server for edit
    notifyListeners();
  }

  Future<void> getFeedbackOfBusiness(String id) async {
    businessFeedback = [];
    final response = await http.get(
        Uri.parse('https://balti-api.herokuapp.com/api/feedbacks/$id/bus'));

    print("********************");
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i = i + 1) {
        businessFeedback.add(FeedbackItem.fromJson(jsonResponse[i]));
      }
      // return businesses.firstWhere((bus) => bus.id == id);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load feedback');
    }
    notifyListeners();
  }

  Future<void> getFeedbackOfProduct(String id) async {
    productFeedback = [];
    final response = await http.get(
        Uri.parse('https://balti-api.herokuapp.com/api/feedbacks/$id/prod'));

    print("********************");
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      for (var i = 0; i < jsonResponse.length; i = i + 1) {
        productFeedback.add(FeedbackItem.fromJson(jsonResponse[i]));
      }
      // return businesses.firstWhere((bus) => bus.id == id);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load feedback');
    }
    notifyListeners();
  }

  Future<void> fetchAndSetFeedbackItems() async {
    businessFeedback = [
      FeedbackItem(
          id: '1',
          businessId: '1',
          userId: '1',
          prodId: '1',
          comment: 'This is the best product I have ever used in my life.',
          rating: 4),
      FeedbackItem(
          id: '2',
          businessId: '',
          userId: '2',
          prodId: '2',
          comment: 'Not recomended',
          rating: 1),
      FeedbackItem(
          id: '3',
          businessId: '3',
          userId: '3',
          prodId: '3',
          comment:
              'This is the best product I have ever used in my life.This is the best product I have ever used in my life.This is the best product I have ever used in my life.This is the best product I have ever used in my life.',
          rating: 3),
      FeedbackItem(
          id: '4',
          businessId: '4',
          userId: '4',
          prodId: '4',
          comment: 'never ',
          rating: 2),
      FeedbackItem(
          id: '5',
          businessId: '5',
          userId: '5',
          prodId: '5',
          comment: 'This is the best product I have ever used in my life.',
          rating: 5),
    ];
    notifyListeners();
  }
}
