
class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? code;
  String? token;
  int? cityId;

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.code,
        this.token,
        this.phone,
        this.cityId,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city_id'] = this.cityId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['code'] = this.code;


    return data;
  }
}