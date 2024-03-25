import 'base_send_api.dart';

class ForgetAllSendApi extends SendApi {
  final String forget_all;

  ForgetAllSendApi({
    this.forget_all = "",
  });

  @override
  Map<String, dynamic> toJson() => {
        "forget_all": forget_all,
      };
}
