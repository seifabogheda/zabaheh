class OrderDetailsModel {
  int? id;
  User? user;
  Variant? variant;
  int? quantity;
  String? totalPrice;
  String? status;
  String? shippingAddress;
  String? notes;
  String? orderDate;

  OrderDetailsModel(
      {this.id,
        this.user,
        this.variant,
        this.quantity,
        this.totalPrice,
        this.status,
        this.shippingAddress,
        this.notes,
        this.orderDate});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    variant =
    json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    status = json['status'];
    shippingAddress = json['shipping_address'];
    notes = json['notes'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['shipping_address'] = this.shippingAddress;
    data['notes'] = this.notes;
    data['order_date'] = this.orderDate;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;

  User({this.id, this.name, this.email, this.phone, this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}

class Variant {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  String? variantWeight;
  String? variantPrice;

  Variant(
      {this.id,
        this.productId,
        this.productName,
        this.productImage,
        this.variantWeight,
        this.variantPrice});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    variantWeight = json['variant_weight'];
    variantPrice = json['variant_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['variant_weight'] = this.variantWeight;
    data['variant_price'] = this.variantPrice;
    return data;
  }
}
