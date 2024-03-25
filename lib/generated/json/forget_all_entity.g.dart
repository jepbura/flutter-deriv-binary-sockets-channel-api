import 'package:price_picker/generated/json/base/json_convert_content.dart';
import 'package:price_picker/features/data/models/socket/forget_all_entity.dart';

ForgetAllEntity $ForgetAllEntityFromJson(Map<String, dynamic> json) {
  final ForgetAllEntity forgetAllEntity = ForgetAllEntity();
  final ForgetAllEchoReq? echoReq =
      jsonConvert.convert<ForgetAllEchoReq>(json['echo_req']);
  if (echoReq != null) {
    forgetAllEntity.echoReq = echoReq;
  }
  final List<dynamic>? forgetAll =
      jsonConvert.convertListNotNull<dynamic>(json['forget_all']);
  if (forgetAll != null) {
    forgetAllEntity.forgetAll = forgetAll;
  }
  final String? msgType = jsonConvert.convert<String>(json['msg_type']);
  if (msgType != null) {
    forgetAllEntity.msgType = msgType;
  }
  return forgetAllEntity;
}

Map<String, dynamic> $ForgetAllEntityToJson(ForgetAllEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['echo_req'] = entity.echoReq?.toJson();
  data['forget_all'] = entity.forgetAll;
  data['msg_type'] = entity.msgType;
  return data;
}

ForgetAllEchoReq $ForgetAllEchoReqFromJson(Map<String, dynamic> json) {
  final ForgetAllEchoReq forgetAllEchoReq = ForgetAllEchoReq();
  final String? forgetAll = jsonConvert.convert<String>(json['forget_all']);
  if (forgetAll != null) {
    forgetAllEchoReq.forgetAll = forgetAll;
  }
  return forgetAllEchoReq;
}

Map<String, dynamic> $ForgetAllEchoReqToJson(ForgetAllEchoReq entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['forget_all'] = entity.forgetAll;
  return data;
}
