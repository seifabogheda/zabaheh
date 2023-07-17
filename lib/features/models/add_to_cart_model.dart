class AddToCartModel {
  int? productId;
  int? quantity;
  List<int>? options;

  AddToCartModel(
      {
        this.productId,
        this.quantity,
        this.options,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    for (int i = 0; i < options!.length; i++) {
      data['options[$i]'] = options![i];
    }

    return data;
  }
}
