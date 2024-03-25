import 'package:price_picker/generated/json/base/json_convert_content.dart';
import 'package:price_picker/features/data/models/socket/forget_entity.dart';

ForgetEntity $ForgetEntityFromJson(Map<String, dynamic> json) {
  final ForgetEntity forgetEntity = ForgetEntity();
  final ForgetEchoReq? echoReq =
      jsonConvert.convert<ForgetEchoReq>(json['echo_req']);
  if (echoReq != null) {
    forgetEntity.echoReq = echoReq;
  }
  final int? forget = jsonConvert.convert<int>(json['forget']);
  if (forget != null) {
    forgetEntity.forget = forget;
  }
  final String? msgType = jsonConvert.convert<String>(json['msg_type']);
  if (msgType != null) {
    forgetEntity.msgType = msgType;
  }
  return forgetEntity;
}

Map<String, dynamic> $ForgetEntityToJson(ForgetEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['echo_req'] = entity.echoReq?.toJson();
  data['forget'] = entity.forget;
  data['msg_type'] = entity.msgType;
  return data;
}

ForgetEchoReq $ForgetEchoReqFromJson(Map<String, dynamic> json) {
  final ForgetEchoReq forgetEchoReq = ForgetEchoReq();
  final String? forget = jsonConvert.convert<String>(json['forget']);
  if (forget != null) {
    forgetEchoReq.forget = forget;
  }
  return forgetEchoReq;
}

Map<String, dynamic> $ForgetEchoReqToJson(ForgetEchoReq entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['forget'] = entity.forget;
  return data;
}
