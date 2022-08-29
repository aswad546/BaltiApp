// ignore: file_names
import 'package:flutter/foundation.dart';

import '../models/feedback_item.dart';

class FeedbackItems with ChangeNotifier {
  final String authToken;
  final String userId;

  FeedbackItems({
    required this.authToken,
    required this.feedbackItems,
    required this.userId,
  });

  List<FeedbackItem> feedbackItems = [];

  List<FeedbackItem> get getFeedbackItems {
    return [...feedbackItems];
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

  Future<void> deleteFeedbackItem(String id) async {
    //Send Api call to server for delete
    notifyListeners();
  }

  Future<void> fetchAndSetFeedbackItems() async {
    feedbackItems = [
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
