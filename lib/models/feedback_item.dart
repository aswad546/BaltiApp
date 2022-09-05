import 'package:flutter/foundation.dart';

class FeedbackItem with ChangeNotifier {
  final String id;
  final String businessId;
  final String userId;
  final String prodId;
  final String comment;
  final int rating;

  FeedbackItem({
    required this.id,
    required this.businessId,
    required this.userId,
    required this.prodId,
    required this.comment,
    required this.rating,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: json['_id'],
      userId: json['user_id'],
      businessId: json['business_id'],
      prodId: json['prod_id'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }
}
