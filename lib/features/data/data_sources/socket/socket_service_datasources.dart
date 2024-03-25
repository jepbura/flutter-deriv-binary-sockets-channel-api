import 'dart:async';
import '../../../../utils/utils.dart';
import 'services/service.dart';

abstract class SocketServiceDatasource {
  Future<bool> send(SendApi apiParams);

  Future<bool> receive(Function returnFunction);
}

class SocketServiceDatasourceImpl implements SocketServiceDatasource {
  final Socket _Socket;

  // final Completer<String> completer = Completer<String>();

  SocketServiceDatasourceImpl(this._Socket);

  @override
  Future<bool> send(SendApi apiParams) async {
    // print("SocketServiceDatasource apiParams is: ${apiParams.toJson()}");
    return _Socket.send(apiParams);

    // try {
    //   final _response = await _client.postRequest(
    //     ListApi.login,
    //     data: apiParams.toJson(),
    //   );
    //   final _result = LoginResponse.fromJson(_response.data);

    //   if (_response.statusCode == 200) {
    //     return _result;
    //   } else {
    //     throw ServerException(_result.error);
    //   }
    // } on ServerException catch (e) {
    //   throw ServerException(e.message);
    // }
  }

  @override
  Future<bool> receive(Function returnFunction) async {
    try {
      _Socket.getSocketStream().listen((value) {
        returnFunction(value);
      });
      return true;
    } catch (error) {
      return false;
    }
  }
}
