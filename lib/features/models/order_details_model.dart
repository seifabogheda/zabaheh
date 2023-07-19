import 'package:base_flutter/features/models/time_model.dart';

class OrderDetailsModel {
  int? id;
  UserOrder? user;
  List<ProductsOrder>? products;
  Location? location;
  String? orderNumber;
  String? deliveryDate;
  TimeModel? deliveryTime;
  String? deliveryType;
  num? subtotal;
  num? total;
  num? shippingCost;
  num? couponDiscount;
  String? orderStatus;
  String? note;
  String? valueAdded;

  OrderDetailsModel(
      {this.id,
      this.user,
      this.products,
      this.location,
      this.orderNumber,
      this.deliveryDate,
      this.deliveryTime,
      this.deliveryType,
      this.couponDiscount,
      this.shippingCost,
      this.subtotal,
      this.total,
      this.orderStatus,
      this.note,
      this.valueAdded});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserOrder.fromJson(json['user']) : null;
    if (json['products'] != null) {
      products = <ProductsOrder>[];
      json['products'].forEach((v) {
        products!.add(new ProductsOrder.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    orderNumber = json['order_number'];
    deliveryDate = json['delivery_date'];
    deliveryTime = json['delivery_time'] != null
        ? TimeModel.fromJson(json['delivery_time'])
        : null;
    deliveryType = json['delivery_type'];
    subtotal = json['subtotal'];
    total = json['total'];
    orderStatus = json['order_status'];
    note = json['note'];
    valueAdded = json['value_added'];
    shippingCost = json['shipping_cost'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['order_number'] = this.orderNumber;
    data['delivery_date'] = this.deliveryDate;
    if (this.deliveryTime != null) {
      data['deliveryTime'] = this.deliveryTime!.toJson();
    }
    data['delivery_type'] = this.deliveryType;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['order_status'] = this.orderStatus;
    data['note'] = this.note;
    data['value_added'] = this.valueAdded;
    data['coupon_discount'] = this.couponDiscount;
    data['shipping_cost'] = this.shippingCost;
    return data;
  }
}

class UserOrder {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UserOrder({this.firstName, this.lastName, this.email, this.phone});

  UserOrder.fromJson(Map<String, dynamic> json) {
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

class ProductsOrder {
  int? id;
  String? name;
  int? categoryId;
  int? cityId;
  String? cityName;
  String? description;
  String? image;
  int? mainPrice;
  int? discountPrice;
  int? storeQuantity;
  int? status;
  int? orderQuantity;

  ProductsOrder(
      {this.id,
      this.name,
      this.categoryId,
      this.cityId,
      this.cityName,
      this.description,
      this.image,
      this.mainPrice,
      this.discountPrice,
      this.storeQuantity,
      this.orderQuantity,
      this.status});

  ProductsOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    description = json['description'];
    image = json['image'];
    mainPrice = json['main_price'];
    discountPrice = json['discount_price'];
    storeQuantity = json['store_quantity'];
    orderQuantity = json['order_quantity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['description'] = this.description;
    data['image'] = this.image;
    data['main_price'] = this.mainPrice;
    data['discount_price'] = this.discountPrice;
    data['store_quantity'] = this.storeQuantity;
    data['status'] = this.status;
    data['order_quantity'] = this.orderQuantity;
    return data;
  }
}

class Location {
  int? userId;
  int? cityId;
  String? address;
  String? long;
  String? lat;

  Location({this.userId, this.cityId, this.address, this.long, this.lat});

  Location.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    cityId = json['city_id '];
    address = json['address'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['city_id '] = this.cityId;
    data['address'] = this.address;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}
