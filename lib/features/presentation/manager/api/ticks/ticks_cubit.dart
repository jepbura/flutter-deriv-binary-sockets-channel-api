import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/utils.dart';
import '../../../../data/data_sources/socket/services/service.dart';
import '../../../../data/models/models.dart';

part 'ticks_state.dart';

class TicksCubit extends Cubit<TicksState> {
  final Socket socket;

  TicksCubit(this.socket) : super(TicksInitial()) {
    socket.getSocketStream().listen((receiveApi) {
      receiveApi.fold(
        (l) {
          if (l is ServerFailure) {
            emit(const TicksData()
                .copyWith(status: SocketStatus.failure, message: l.message));
          }
        },
        (r) {
          if (r.msgType == "tick") {
            TicksEntity data = r.data;
            double? firstTicksQuote = data.tick!.quote;
            if (state is TicksData) {
              firstTicksQuote =
                  (state.props[0] == data.tick!.symbol && state.props[1] != 0
                      ? state.props[1]
                      : data.tick!.quote) as double?;
              ticksStateRefreshing();
            }

            emit(const TicksData().copyWith(
                symbolName: data.tick!.symbol,
                symbolId: data.tick!.id,
                firstTicksQuote: firstTicksQuote,
                status: SocketStatus.success,
                message: "Socket send success",
                data: r.data));
          }
        },
      );
    },
        onDone: () => emit(const TicksData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onDone")),
        onError: (error) => emit(const TicksData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onError")));
  }

  ticksStateRefreshing() {
    emit(TicksStateRefreshing());
  }

  ticksStateInitial() {
    emit(TicksInitial());
  }
}
