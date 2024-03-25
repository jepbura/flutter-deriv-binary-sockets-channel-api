import 'package:price_picker/generated/json/base/json_field.dart';
import 'package:price_picker/generated/json/ping_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PingEntity {
  int? ping;

  PingEntity();

  factory PingEntity.fromJson(Map<String, dynamic> json) =>
      $PingEntityFromJson(json);

  Map<String, dynamic> toJson() => $PingEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
