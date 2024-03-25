import 'package:price_picker/generated/json/base/json_convert_content.dart';
import 'package:price_picker/features/data/models/socket/ticks_entity.dart';

TicksEntity $TicksEntityFromJson(Map<String, dynamic> json) {
  final TicksEntity ticksEntity = TicksEntity();
  final TicksEchoReq? echoReq =
      jsonConvert.convert<TicksEchoReq>(json['echo_req']);
  if (echoReq != null) {
    ticksEntity.echoReq = echoReq;
  }
  final String? msgType = jsonConvert.convert<String>(json['msg_type']);
  if (msgType != null) {
    ticksEntity.msgType = msgType;
  }
  final TicksSubscription? subscription =
      jsonConvert.convert<TicksSubscription>(json['subscription']);
  if (subscription != null) {
    ticksEntity.subscription = subscription;
  }
  final TicksTick? tick = jsonConvert.convert<TicksTick>(json['tick']);
  if (tick != null) {
    ticksEntity.tick = tick;
  }
  return ticksEntity;
}

Map<String, dynamic> $TicksEntityToJson(TicksEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['echo_req'] = entity.echoReq?.toJson();
  data['msg_type'] = entity.msgType;
  data['subscription'] = entity.subscription?.toJson();
  data['tick'] = entity.tick?.toJson();
  return data;
}

TicksEchoReq $TicksEchoReqFromJson(Map<String, dynamic> json) {
  final TicksEchoReq ticksEchoReq = TicksEchoReq();
  final int? subscribe = jsonConvert.convert<int>(json['subscribe']);
  if (subscribe != null) {
    ticksEchoReq.subscribe = subscribe;
  }
  final String? ticks = jsonConvert.convert<String>(json['ticks']);
  if (ticks != null) {
    ticksEchoReq.ticks = ticks;
  }
  return ticksEchoReq;
}

Map<String, dynamic> $TicksEchoReqToJson(TicksEchoReq entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['subscribe'] = entity.subscribe;
  data['ticks'] = entity.ticks;
  return data;
}

TicksSubscription $TicksSubscriptionFromJson(Map<String, dynamic> json) {
  final TicksSubscription ticksSubscription = TicksSubscription();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    ticksSubscription.id = id;
  }
  return ticksSubscription;
}

Map<String, dynamic> $TicksSubscriptionToJson(TicksSubscription entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  return data;
}

TicksTick $TicksTickFromJson(Map<String, dynamic> json) {
  final TicksTick ticksTick = TicksTick();
  final double? ask = jsonConvert.convert<double>(json['ask']);
  if (ask != null) {
    ticksTick.ask = ask;
  }
  final double? bid = jsonConvert.convert<double>(json['bid']);
  if (bid != null) {
    ticksTick.bid = bid;
  }
  final int? epoch = jsonConvert.convert<int>(json['epoch']);
  if (epoch != null) {
    ticksTick.epoch = epoch;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    ticksTick.id = id;
  }
  final int? pipSize = jsonConvert.convert<int>(json['pip_size']);
  if (pipSize != null) {
    ticksTick.pipSize = pipSize;
  }
  final double? quote = jsonConvert.convert<double>(json['quote']);
  if (quote != null) {
    ticksTick.quote = quote;
  }
  final String? symbol = jsonConvert.convert<String>(json['symbol']);
  if (symbol != null) {
    ticksTick.symbol = symbol;
  }
  return ticksTick;
}

Map<String, dynamic> $TicksTickToJson(TicksTick entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ask'] = entity.ask;
  data['bid'] = entity.bid;
  data['epoch'] = entity.epoch;
  data['id'] = entity.id;
  data['pip_size'] = entity.pipSize;
  data['quote'] = entity.quote;
  data['symbol'] = entity.symbol;
  return data;
}
