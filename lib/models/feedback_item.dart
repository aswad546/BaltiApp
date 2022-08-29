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
}
