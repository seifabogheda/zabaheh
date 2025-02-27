class AddToCartModel {
  int? productId;
  int? variantId;
  int? quantity;
  String? couponCode;
  List<OptionsCart>? options;

  AddToCartModel(
      {this.productId,
        this.variantId,
        this.quantity,
        this.couponCode,
        this.options});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    variantId = json['variant_id'];
    quantity = json['quantity'];
    couponCode = json['coupon_code'];
    if (json['options'] != null) {
      options = <OptionsCart>[];
      json['options'].forEach((v) {
        options!.add(new OptionsCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['variant_id'] = this.variantId;
    data['quantity'] = this.quantity;
    data['coupon_code'] = this.couponCode;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionsCart {
  int? optionId;
  int? quantity;
  String? type;

  OptionsCart({this.optionId, this.quantity,this.type});

  OptionsCart.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    data['quantity'] = this.quantity;
    return data;
  }
}
