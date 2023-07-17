class OrdersModel {
  int? currentPage;
  List<OrderData>? orderData;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  OrdersModel(
      {this.currentPage,
      this.orderData,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      orderData = <OrderData>[];
      json['data'].forEach((v) {
        orderData!.add(new OrderData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.orderData != null) {
      data['data'] = this.orderData!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;

    data['next_page_url'] = this.nextPageUrl;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class OrderData {
  int? id;
  int? userId;
  String? orderNumber;
  int? locationId;
  String? deliveryDate;
  int? deliveryTimeId;
  String? deliveryType;
  double? subtotal;
  double? total;
  String? orderStatus;
  String? note;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<ProductsModel>? products;

  OrderData(
      {this.id,
      this.userId,
      this.orderNumber,
      this.locationId,
      this.deliveryDate,
      this.deliveryTimeId,
      this.deliveryType,
      this.subtotal,
      this.total,
      this.orderStatus,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.products});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderNumber = json['order_number'];
    locationId = json['location_id'];
    deliveryDate = json['delivery_date'];
    deliveryTimeId = json['delivery_time_id'];
    deliveryType = json['delivery_type'];
    subtotal = json['subtotal'];
    total = json['total'];
    orderStatus = json['order_status'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_number'] = this.orderNumber;
    data['location_id'] = this.locationId;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_time_id'] = this.deliveryTimeId;
    data['delivery_type'] = this.deliveryType;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['order_status'] = this.orderStatus;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  int? cityId;
  String? code;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.cityId,
      this.code,
      this.deviceToken,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    cityId = json['city_id'];
    code = json['code'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['city_id'] = this.cityId;
    data['code'] = this.code;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductsModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? mainPrice;
  int? discountPrice;
  int? storeQuantity;
  int? status;
  int? categoryId;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  ProductsModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.mainPrice,
      this.discountPrice,
      this.storeQuantity,
      this.status,
      this.categoryId,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    mainPrice = json['main_price'];
    discountPrice = json['discount_price'];
    storeQuantity = json['store_quantity'];
    status = json['status'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['main_price'] = this.mainPrice;
    data['discount_price'] = this.discountPrice;
    data['store_quantity'] = this.storeQuantity;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? orderId;
  int? productId;
  int? price;
  int? quantity;
  String? note;
  String? options;

  Pivot(
      {this.orderId,
      this.productId,
      this.price,
      this.quantity,
      this.note,
      this.options});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    note = json['note'];
    options = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['note'] = this.note;
    data['options'] = this.options;
    return data;
  }
}

