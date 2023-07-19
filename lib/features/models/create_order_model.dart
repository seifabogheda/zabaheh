class CreateOrderModel {
  String? deliveryDate;
  String? deliveryType;
  String? address;
  String? note;
  String? coupon;
  String? long;
  String? lat;
  int? deliveryTimeId;
  int? cityId;

  CreateOrderModel(
      {this.deliveryDate,
      this.deliveryTimeId,
      this.deliveryType,
      this.address,
      this.note,
      this.lat,
      this.coupon,
      this.cityId,
      this.long});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_date'] = this.deliveryDate;
    data['delivery_time_id'] = this.deliveryTimeId;
    data['delivery_type'] = this.deliveryType;
    data['address'] = this.address;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['city_id'] = this.cityId;
    data['note'] = this.note;
    data['coupon'] = this.coupon;

    return data;
  }
}
