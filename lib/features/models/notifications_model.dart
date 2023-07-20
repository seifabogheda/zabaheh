class NotificationModel {
  UserNotification? user;
  OrderNotification? order;
  String? title;
  String? body;
  String? createdAt;
  String? logo;

  NotificationModel(
      {this.user,
        this.order,
        this.title,
        this.body,
        this.createdAt,
        this.logo});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserNotification.fromJson(json['user']) : null;
    order = json['order'] != null ? new OrderNotification.fromJson(json['order']) : null;
    title = json['title'];
    body = json['body'];
    createdAt = json['created_at'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['title'] = this.title;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['logo'] = this.logo;
    return data;
  }
}

class UserNotification {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UserNotification({this.firstName, this.lastName, this.email, this.phone});

  UserNotification.fromJson(Map<String, dynamic> json) {
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

class OrderNotification {
  int? id;
  String? orderNumber;
  String? deliveryDate;
  int? deliveryTimeId;
  String? deliveryType;
  double? subtotal;
  double? total;
  String? orderStatus;
  String? note;

  OrderNotification(
      {this.id,
        this.orderNumber,
        this.deliveryDate,
        this.deliveryTimeId,
        this.deliveryType,
        this.subtotal,
        this.total,
        this.orderStatus,
        this.note});

  OrderNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    deliveryDate = json['delivery_date'];
    deliveryTimeId = json['delivery_time_id'];
    deliveryType = json['delivery_type'];
    subtotal = json['subtotal'];
    total = json['total'];
    orderStatus = json['order_status'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_time_id'] = this.deliveryTimeId;
    data['delivery_type'] = this.deliveryType;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['order_status'] = this.orderStatus;
    data['note'] = this.note;
    return data;
  }
}
