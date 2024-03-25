import 'package:price_picker/generated/json/base/json_field.dart';
import 'package:price_picker/generated/json/ticks_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TicksEntity {
  @JSONField(name: "echo_req")
  TicksEchoReq? echoReq;
  @JSONField(name: "msg_type")
  String? msgType;
  TicksSubscription? subscription;
  TicksTick? tick;

  TicksEntity();

  factory TicksEntity.fromJson(Map<String, dynamic> json) =>
      $TicksEntityFromJson(json);

  Map<String, dynamic> toJson() => $TicksEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TicksEchoReq {
  int? subscribe;
  String? ticks;

  TicksEchoReq();

  factory TicksEchoReq.fromJson(Map<String, dynamic> json) =>
      $TicksEchoReqFromJson(json);

  Map<String, dynamic> toJson() => $TicksEchoReqToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TicksSubscription {
  String? id;

  TicksSubscription();

  factory TicksSubscription.fromJson(Map<String, dynamic> json) =>
      $TicksSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => $TicksSubscriptionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TicksTick {
  double? ask;
  double? bid;
  int? epoch;
  String? id;
  @JSONField(name: "pip_size")
  int? pipSize;
  double? quote;
  String? symbol;

  TicksTick();

  factory TicksTick.fromJson(Map<String, dynamic> json) =>
      $TicksTickFromJson(json);

  Map<String, dynamic> toJson() => $TicksTickToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
