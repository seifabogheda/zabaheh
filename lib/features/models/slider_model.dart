class SliderModel {
  int? id;
  String? image;
  String? title;
  String? description;
  int? active;
  String? createdAt;
  String? updatedAt;

  SliderModel(
      {this.id,
        this.image,
        this.title,
        this.description,
        this.active,
        this.createdAt,
        this.updatedAt});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
