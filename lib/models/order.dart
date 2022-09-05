class Order {
  final String id;
  final String userId;
  final String businessId;
  final String timeOfOrder;
  final double payableAmount;
  final String deliveryTime;
  final String deliveryLocation;
  final double lat;
  final double lng;
  final String status;

  Order({
    required this.id,
    required this.userId,
    required this.businessId,
    required this.timeOfOrder,
    required this.payableAmount,
    required this.deliveryTime,
    required this.deliveryLocation,
    required this.lat,
    required this.lng,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      userId: json['user_id'],
      businessId: json['business_id'],
      timeOfOrder: json['time_of_order'],
      payableAmount: json['payable_amount'],
      lat: 0, // hardcoded for now, to be changed when backend is fixed
      lng: 0, // hardcoded for now, to be changed when backend is fixed
      deliveryTime: json['delivery_time'],
      deliveryLocation: json['delivery_location'],
      status: json['status'],
    );
  }
}
