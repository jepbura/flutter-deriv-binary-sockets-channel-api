import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../utils/utils.dart';
import '../../../../data/data_sources/socket/services/service.dart';
import '../../../../data/models/models.dart';

part 'symbols_state.dart';

class SymbolsCubit extends Cubit<SymbolsState> {
  final Socket socket;

  SymbolsCubit(this.socket) : super(SymbolsInitial()) {
    socket.getSocketStream().listen((receiveApi) {
      receiveApi.fold(
        (l) {
          if (l is ServerFailure) {
            emit(const SymbolsData()
                .copyWith(status: SocketStatus.failure, message: l.message));
          }
        },
        (r) {
          if (r.msgType == "active_symbols") {
            emit(const SymbolsData().copyWith(
                status: SocketStatus.success,
                message: "Socket send success",
                data: r.data));
          }
        },
      );
    },
        onDone: () => emit(const SymbolsData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onDone")),
        onError: (error) => emit(const SymbolsData().copyWith(
            status: SocketStatus.failure, message: "Socket receive onError")));
  }
}
