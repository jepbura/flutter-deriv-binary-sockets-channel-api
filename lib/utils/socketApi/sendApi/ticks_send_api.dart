import 'base_send_api.dart';

class TicksSendApi extends SendApi {
  final String ticks;
  final int subscribe;

  TicksSendApi({
    this.ticks = "",
    this.subscribe = 1,
  });

  @override
  Map<String, dynamic> toJson() => {
        "ticks": ticks,
        "subscribe": subscribe,
      };
}
