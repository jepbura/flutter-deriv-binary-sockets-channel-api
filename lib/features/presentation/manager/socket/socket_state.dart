part of 'socket_cubit.dart';

abstract class SocketState extends Equatable {
  const SocketState();

  @override
  List<Object> get props => [];
}

class SocketInitial extends SocketState {}

class SocketFailure extends SocketState {}

class SocketData extends SocketState {
  final SocketStatus status;
  final String msgType;
  final String message;

  const SocketData({
    this.status = SocketStatus.loading,
    this.msgType = '',
    this.message = '',
  }) : super();

  SocketData copyWith({
    SocketStatus? status,
    String? msgType,
    String? message,
  }) {
    return SocketData(
      status: status ?? this.status,
      msgType: msgType ?? this.msgType,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [];
}
