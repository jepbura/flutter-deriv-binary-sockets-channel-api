import 'package:dartz/dartz.dart';
import '../../../../utils/utils.dart';
import '../../domain.dart';

class SocketSend extends UseCase<bool, SendApi> {
  final SocketRepository _repo;

  SocketSend(this._repo);

  @override
  Future<Either<Failure, bool>> call(SendApi params) => _repo.send(params);
}
