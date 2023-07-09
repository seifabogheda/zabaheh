

class UpdateProfileModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  String? lang;
  int? cityId;

  UpdateProfileModel(
      {
        this.firstName,
        this.lastName,
        this.email,

        this.lang,
        this.phone,
        this.cityId,
      });

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    lang = json['lang'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lang'] = this.lang;
    data['city_id'] = this.cityId;


    return data;
  }
}