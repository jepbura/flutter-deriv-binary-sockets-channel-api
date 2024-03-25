import 'base_send_api.dart';

class ForgetSendApi extends SendApi {
  final String forget;

  ForgetSendApi({
    this.forget = "",
  });

  @override
  Map<String, dynamic> toJson() => {
        "forget": forget,
      };
}
