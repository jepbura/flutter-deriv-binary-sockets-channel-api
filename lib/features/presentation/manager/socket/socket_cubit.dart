import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../utils/utils.dart';
import '../../../data/data_sources/datasources.dart';
import '../../../domain/domain.dart';

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  final SocketSend _socketSend;

  /*final SocketReceive _socketReceive;*/
  final Socket socket;

  SocketCubit(this._socketSend, this.socket) : super(SocketInitial()) {
    socket.getSocketStream().listen((receiveApi) {
      receiveApi.fold(
        (l) {
          if (l is ServerFailure) {
            emit(const SocketData().copyWith(
                status: SocketStatus.failure, message: l.message, msgType: ""));
          }
        },
        (r) {
          // print('Value1: ${r.msgType}');
          emit(const SocketData().copyWith(
              status: SocketStatus.success,
              message: "Socket send success",
              msgType: r.msgType));
        },
      );
    },
        onDone: () => emit(const SocketData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onDone")),
        onError: (error) => emit(const SocketData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onError")));

    /*_socketReceive.call(recive).then((value) {
      value.fold(
        (l) {
          if (l is ServerFailure) {
            emit(SocketData()
                .copyWith(status: SocketStatus.failure, message: l.message));
          }
        },
        (r) {
          if (r) {
            emit(SocketData().copyWith(status: SocketStatus.success));
          } else {
            emit(SocketData().copyWith(status: SocketStatus.failure));
          }
        },
      );
    });*/
  }

  /*Future<void> recive(data) async {
    print('Value2: $data');
    emit(const SocketData().copyWith(message: data));
  }*/

  Future<void> send({required SendApi params, required String msgType}) async {
    final data = await _socketSend.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(const SocketData().copyWith(
              status: SocketStatus.failure,
              message: "Socket send error",
              msgType: ""));
        }
      },
      (r) {
        emit(const SocketData().copyWith(
            status: SocketStatus.success,
            message: "Socket send success",
            msgType: msgType));
      },
    );
  }

  @override
  Future<void> close() {
    // _webSocketListener?.cancel();
    return super.close();
  }
}
