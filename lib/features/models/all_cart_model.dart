class GetCartModel {
  int? id;
  ProductId? productId;
  UserId? userId;
  num? price;
  int? quantity;
  String? note;
  List<String>? options;

  GetCartModel(
      {this.productId,
        this.userId,
        this.id,
        this.price,
        this.quantity,
        this.note,
        this.options});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product'] != null
        ? new ProductId.fromJson(json['product'])
        : null;
    userId =
    json['user'] != null ? new UserId.fromJson(json['user']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['id'];
    note = json['note'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productId != null) {
      data['product'] = this.productId!.toJson();
    }
    if (this.userId != null) {
      data['user'] = this.userId!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['note'] = this.note;
    data['options'] = this.options;
    data['id'] = this.id;
    return data;
  }
}

class ProductId {
  int? id;
  String? name;
  int? categoryId;
  int? cityId;
  String? description;
  String? image;
  num? mainPrice;
  num? discountPrice;
  int? storeQuantity;
  int? status;

  ProductId(
      {this.id,
        this.name,
        this.categoryId,
        this.cityId,
        this.description,
        this.image,
        this.mainPrice,
        this.discountPrice,
        this.storeQuantity,
        this.status});

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    description = json['description'];
    image = json['image'];
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
    data['city_id'] = this.cityId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['main_price'] = this.mainPrice;
    data['discount_price'] = this.discountPrice;
    data['store_quantity'] = this.storeQuantity;
    data['status'] = this.status;
    return data;
  }
}

class UserId {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UserId({this.firstName, this.lastName, this.email, this.phone});

  UserId.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
