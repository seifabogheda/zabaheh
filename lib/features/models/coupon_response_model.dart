
class CouponResponseModel {
  int? totalPriceBeforeDiscount;
  num? discountAmount;
  num? finalTotalPrice;

  CouponResponseModel(
      {this.totalPriceBeforeDiscount,
        this.discountAmount,
        this.finalTotalPrice});

  CouponResponseModel.fromJson(Map<String, dynamic> json) {
    totalPriceBeforeDiscount = json['total_price_before_discount'];
    discountAmount = json['discount_amount'];
    finalTotalPrice = json['final_total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_price_before_discount'] = this.totalPriceBeforeDiscount;
    data['discount_amount'] = this.discountAmount;
    data['final_total_price'] = this.finalTotalPrice;
    return data;
  }
}
