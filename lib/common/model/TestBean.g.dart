// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestBean _$TestBeanFromJson(Map<String, dynamic> json) {
  return new TestBean(
      name: json['name'] as String,
      email: json['email'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      pushId: json['push_id'] as int);
}

abstract class _$TestBeanSerializerMixin {
  String get name;
  String get email;
  DateTime get date;
  int get pushId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'date': date?.toIso8601String(),
        'push_id': pushId
      };
}
