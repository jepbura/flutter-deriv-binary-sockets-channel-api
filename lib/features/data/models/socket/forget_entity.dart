import 'package:price_picker/generated/json/base/json_field.dart';
import 'package:price_picker/generated/json/forget_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ForgetEntity {
  @JSONField(name: "echo_req")
  ForgetEchoReq? echoReq;
  int? forget;
  @JSONField(name: "msg_type")
  String? msgType;

  ForgetEntity();

  factory ForgetEntity.fromJson(Map<String, dynamic> json) =>
      $ForgetEntityFromJson(json);

  Map<String, dynamic> toJson() => $ForgetEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ForgetEchoReq {
  String? forget;

  ForgetEchoReq();

  factory ForgetEchoReq.fromJson(Map<String, dynamic> json) =>
      $ForgetEchoReqFromJson(json);

  Map<String, dynamic> toJson() => $ForgetEchoReqToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
