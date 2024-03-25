import 'package:price_picker/generated/json/base/json_field.dart';
import 'package:price_picker/generated/json/forget_all_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ForgetAllEntity {
  @JSONField(name: "echo_req")
  ForgetAllEchoReq? echoReq;
  @JSONField(name: "forget_all")
  List<dynamic>? forgetAll;
  @JSONField(name: "msg_type")
  String? msgType;

  ForgetAllEntity();

  factory ForgetAllEntity.fromJson(Map<String, dynamic> json) =>
      $ForgetAllEntityFromJson(json);

  Map<String, dynamic> toJson() => $ForgetAllEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ForgetAllEchoReq {
  @JSONField(name: "forget_all")
  String? forgetAll;

  ForgetAllEchoReq();

  factory ForgetAllEchoReq.fromJson(Map<String, dynamic> json) =>
      $ForgetAllEchoReqFromJson(json);

  Map<String, dynamic> toJson() => $ForgetAllEchoReqToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
