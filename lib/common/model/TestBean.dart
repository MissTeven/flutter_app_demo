import 'package:json_annotation/json_annotation.dart';

part 'TestBean.g.dart';

@JsonSerializable()
class TestBean extends Object with _$TestBeanSerializerMixin {
  String name;
  String email;
  DateTime date;

  ///通过JsonKey重新定义参数名
  @JsonKey(name: "push_id")
  int pushId;

  TestBean({this.name, this.email, this.date, this.pushId});

  factory TestBean.fromJson(Map<String, dynamic> json) =>
      _$TestBeanFromJson(json);
}
