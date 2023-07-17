class Products {
  int? id;
  String? name;
  int? categoryId;
  String? description;
  String? image;
  String? cityName;
  num? mainPrice;
  num? discountPrice;
  int? storeQuantity;
  int? status;

  Products(
      {this.name,
        this.categoryId,
        this.id,
        this.description,
        this.image,
        this.cityName,
        this.mainPrice,
        this.discountPrice,
        this.storeQuantity,
        this.status});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    description = json['description'];
    image = json['image'];
    cityName = json['city_name'];
    mainPrice = json['main_price'];
    discountPrice = json['discount_price'];
    storeQuantity = json['store_quantity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['main_price'] = this.mainPrice;
    data['discount_price'] = this.discountPrice;
    data['store_quantity'] = this.storeQuantity;
    data['status'] = this.status;
    data['city_name'] = this.cityName;
    return data;
  }
}