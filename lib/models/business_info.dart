class BusinessInfo {
  String? name;
  String? id;
  String? type;
  String? location;
  String? description;
  String? image;
  int? overall_rating;
  int? delivery_charges;
  int? noOfProducts;

  BusinessInfo(
      {this.name = "Business",
      this.id = "id",
      this.type,
      this.location,
      this.description,
      this.image = "image",
      this.overall_rating,
      this.delivery_charges,
      this.noOfProducts = 2});
}
