import 'package:json_annotation/json_annotation.dart';

part "User.g.dart";

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String name;
  String address;
  int age;
  int sex;

  // 命名构造函数
  User.empty();

  User({this.name, this.address, this.age, this.sex});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
