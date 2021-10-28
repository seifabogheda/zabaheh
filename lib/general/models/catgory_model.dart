class Category {
  int id;
  String name;
  Category({required this.id, required this.name});
  factory Category.fromJson(Map json) {
    return Category(id: json['id'], name: json['name']);
  }

  @override
  String toString() {
    return name;
  }

}
