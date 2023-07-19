
class TimeModel {
  int? id;
  String? from;
  String? to;

  TimeModel({this.id,this.from, this.to});

  TimeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
