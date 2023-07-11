class OptionModel {
  int? id;
  String? name;
  String? inputType;
  List<OptionValues>? optionValues;

  OptionModel({this.id, this.name, this.inputType, this.optionValues});

  OptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    inputType = json['input_type'];
    if (json['option_values'] != null) {
      optionValues = <OptionValues>[];
      json['option_values'].forEach((v) {
        optionValues!.add(new OptionValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['input_type'] = this.inputType;
    if (this.optionValues != null) {
      data['option_values'] =
          this.optionValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionValues {
  int? id;
  String? value;
  int? price;
  String? option;

  OptionValues({this.id, this.value, this.price, this.option});

  OptionValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    price = json['price'];
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['price'] = this.price;
    data['option'] = this.option;
    return data;
  }
}
