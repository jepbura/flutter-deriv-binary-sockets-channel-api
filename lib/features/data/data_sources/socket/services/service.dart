import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../../utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../domain/entities/entities.dart';

class Socket {
  WebSocketChannel? channel;
  StreamSubscription? _webSocketListener;
  bool _connectCheck = false;

  final StreamController<Either<Failure, ReceiveApi>> controller =
      StreamController<Either<Failure, ReceiveApi>>.broadcast();

  Stream<Either<Failure, ReceiveApi>> getSocketStream() => controller.stream;

  Socket() : super() {
    // _connectSocket(apiParams: PingSendApi(ping: 1));
  }

  Future<void> _connectSocket({required SendApi apiParams}) async {
    try {
      channel = WebSocketChannel.connect(
          Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'));

      channel!.sink.add(jsonEncode(apiParams.toJson()));
      _webSocketListener = channel?.stream
          .map<Map<String, dynamic>?>(
              (Object? result) => jsonDecode(result.toString()))
          .listen(
        (Map<String, dynamic>? message) {
          if (message != null && message.containsKey("msg_type")) {
            _connectCheck = true;
            dynamic newMsg = _messageChecker(message);
            // print('message is : ${message["msg_type"]}');

            controller.sink.add(Right(ReceiveApi(
                msgType: msgType[message["msg_type"].toString()] ?? "",
                data: newMsg)));
          } else {
            controller.sink
                .add(const Left(ServerFailure("There is no msg_type")));
          }
        },
        onDone: _onDisconnectedWeb,
        onError: (dynamic error) => _onDisconnectedWeb(),
        // onError: (Object error) {
        //   print('the web socket connection is closed: $error.');
        //   _connectSocket(sendData: '{"ping": 1}');
        // },
        // onDone: () async {
        //   print('web socket is closed.');
        //   _connectSocket(sendData: '{"ping": 1}');
        // },
      );
    } catch (ex) {
      print('web socket is error: $ex');
    }
  }

  dynamic _messageChecker(message) {
    switch (message["msg_type"]) {
      case "ping":
        return PingEntity.fromJson(message);
      case "tick":
        return TicksEntity.fromJson(message);
      case "forget":
        return ForgetEntity.fromJson(message);
      case "forget_all":
        return ForgetAllEntity.fromJson(message);
      case "active_symbols":
        return SymbolsEntity.fromJson(message);
      default:
        return [];
    }
  }

  void _onDisconnectedWeb() {
    print('Disconnected');
    _webSocketListener?.cancel();
    _connectCheck = false;
    // _connectSocket(sendData: '{"ping": 1}');
  }

  bool send(SendApi apiParams) {
    // print("socket connect is: ${channel is WebSocketChannel}");
    try {
      // if (_connectCheck) {
      if (channel is WebSocketChannel && channel?.closeCode == null) {
        channel!.sink.add(jsonEncode(apiParams.toJson()));
      } else {
        _connectSocket(apiParams: apiParams);
      }
      return true;
    } catch (error) {
      return false;
    }
  }
}
