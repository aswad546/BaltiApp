class Business {
  final String id;
  final String ownerId;
  final String name;
  final String phoneNumber;
  final String type;
  final double lat;
  final double lng;
  final String description;
  final String imageUrl;
  final double rating;
  final int deliveryCharges;
  final String locationDescription;

  Business({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.phoneNumber,
    required this.type,
    required this.lat,
    required this.lng,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.deliveryCharges,
    required this.locationDescription,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['_id'],
      ownerId: json['user'],
      name: json['name'],
      phoneNumber:
          "phoneNumber", // hardcoded for now, to be changed when backend is fixed
      type: json['type'],
      lat: 0, // hardcoded for now, to be changed when backend is fixed
      lng: 0, // hardcoded for now, to be changed when backend is fixed
      description: json['description'],
      imageUrl:
          "assets/images/subway.png", // hardcoded for now, to be changed when backend is fixed
      rating: json['overallRating'].toDouble(),
      deliveryCharges: json['delivery_charges'],
      locationDescription: "locationDesc",
    );
  }
}
