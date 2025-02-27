class CreateOrderModel {
  String? shippingAddress;
  String? notes;

  CreateOrderModel({this.shippingAddress, this.notes});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    shippingAddress = json['shipping_address'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   this.shippingAddress != null ? data['shipping_address'] = this.shippingAddress : null;
    this.notes != null  ? data['notes'] = this.notes:null;
    return data;
  }
}
