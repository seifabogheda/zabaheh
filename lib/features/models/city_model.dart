
class CityModel {
  int? id;
  String? nameAr;
  String? nameEn;
  num? shippingCost;

  CityModel({this.id, this.nameAr, this.nameEn,this.shippingCost});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    shippingCost = json['shipping_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['shipping_cost'] = this.shippingCost;
    return data;
  }
}
