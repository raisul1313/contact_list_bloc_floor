import 'package:floor/floor.dart';

@entity
class Contact {
  @primaryKey
  int? id;
  String? name;
  String? mobile;

  Contact({this.id, this.name, this.mobile});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    return data;
  }
}
