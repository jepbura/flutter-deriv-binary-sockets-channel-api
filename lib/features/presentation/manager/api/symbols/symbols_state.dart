part of 'symbols_cubit.dart';

abstract class SymbolsState extends Equatable {
  const SymbolsState();

  @override
  List<Object> get props => [];
}

class SymbolsInitial extends SymbolsState {}

class SymbolsData extends SymbolsState {
  final SocketStatus status;
  final SymbolsEntity? data;
  final String message;

  const SymbolsData({
    this.status = SocketStatus.loading,
    this.data,
    this.message = '',
  }) : super();

  SymbolsData copyWith({
    SocketStatus? status,
    SymbolsEntity? data,
    String? message,
  }) {
    return SymbolsData(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
