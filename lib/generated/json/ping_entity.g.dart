import 'package:price_picker/generated/json/base/json_convert_content.dart';
import 'package:price_picker/features/data/models/socket/ping_entity.dart';

PingEntity $PingEntityFromJson(Map<String, dynamic> json) {
  final PingEntity pingEntity = PingEntity();
  final int? ping = jsonConvert.convert<int>(json['ping']);
  if (ping != null) {
    pingEntity.ping = ping;
  }
  return pingEntity;
}

Map<String, dynamic> $PingEntityToJson(PingEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ping'] = entity.ping;
  return data;
}
