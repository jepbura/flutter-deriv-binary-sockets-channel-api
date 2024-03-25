part of 'ticks_cubit.dart';

abstract class TicksState extends Equatable {
  const TicksState();

  @override
  List<Object> get props => [];
}

class TicksInitial extends TicksState {}

class TicksStateRefreshing extends TicksState {}

class TicksData extends TicksState {
  final SocketStatus status;
  final TicksEntity? data;
  final String message;
  final String symbolId;
  final String symbolName;
  final double firstTicksQuote;

  const TicksData({
    this.status = SocketStatus.loading,
    this.data,
    this.message = '',
    this.symbolId = '',
    this.symbolName = '',
    this.firstTicksQuote = 0,
  }) : super();

  TicksData copyWith({
    SocketStatus? status,
    TicksEntity? data,
    String? message,
    String? symbolId,
    String? symbolName,
    double? firstTicksQuote,
  }) {
    return TicksData(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      symbolId: symbolId ?? this.symbolId,
      symbolName: symbolName ?? this.symbolName,
      firstTicksQuote: firstTicksQuote ?? this.firstTicksQuote,
    );
  }

  @override
  List<Object> get props => [symbolName, firstTicksQuote, symbolId];
}
