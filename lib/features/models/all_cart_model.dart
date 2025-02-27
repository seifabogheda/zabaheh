class GetCartModel {
  int? totalOrderPrice;
  int? deliveryFee;
  List<CartItems>? cartItems;

  GetCartModel({this.totalOrderPrice, this.deliveryFee, this.cartItems});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    totalOrderPrice = json['total_order_price'];
    deliveryFee = json['delivery_fee'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_order_price'] = this.totalOrderPrice;
    data['delivery_fee'] = this.deliveryFee;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? userId;
  int? variantId;
  int? quantity;
  String? totalPrice;
  Variant? variant;
  List<Options>? options;

  CartItems(
      {this.id,
        this.userId,
        this.variantId,
        this.quantity,
        this.totalPrice,
        this.variant,
        this.options});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    variantId = json['variant_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    variant =
    json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['variant_id'] = this.variantId;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variant {
  int? id;
  int? productId;
  String? weight;
  String? price;
  int? stock;
  String? createdAt;
  String? updatedAt;
  Product? product;

  Variant(
      {this.id,
        this.productId,
        this.weight,
        this.price,
        this.stock,
        this.createdAt,
        this.updatedAt,
        this.product});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    weight = json['weight'];
    price = json['price'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['weight'] = this.weight;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  int? categoryId;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.name,
        this.categoryId,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Options {
  int? id;
  int? cartId;
  int? optionId;
  int? quantity;
  String? totalPrice;
  String? createdAt;
  String? updatedAt;

  Options(
      {this.id,
        this.cartId,
        this.optionId,
        this.quantity,
        this.totalPrice,
        this.createdAt,
        this.updatedAt});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    optionId = json['option_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['option_id'] = this.optionId;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
