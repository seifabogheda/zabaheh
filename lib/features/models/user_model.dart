class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? language;
  String? createdAt;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.language,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    language = json['language'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['language'] = this.language;
    data['created_at'] = this.createdAt;
    return data;
  }
}
