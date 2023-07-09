

class RegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? lang;
  int? cityId;

  RegisterModel(
      {
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.lang,
        this.phone,
        this.cityId,
      });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    lang = json['lang'];
    confirmPassword = json['password_confirmation'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmPassword;
    data['lang'] = this.lang;
    data['city_id'] = this.cityId;


    return data;
  }
}