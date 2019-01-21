// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      name: json['name'] as String,
      address: json['address'] as String,
      age: json['age'] as int,
      sex: json['sex'] as int);
}

abstract class _$UserSerializerMixin {
  String get name;
  String get address;
  int get age;
  int get sex;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'address': address,
        'age': age,
        'sex': sex
      };
}
