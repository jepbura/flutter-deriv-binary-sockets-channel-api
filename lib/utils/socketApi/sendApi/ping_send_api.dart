import 'base_send_api.dart';

class PingSendApi extends SendApi {
  final int ping;

  PingSendApi({
    this.ping = 1,
  });

  @override
  Map<String, dynamic> toJson() => {
        "ping": ping,
      };
}
