import 'package:dartz/dartz.dart';
import '../../../../utils/utils.dart';
import '../../domain.dart';

class SocketReceive extends UseCase<bool, Function> {
  final SocketRepository _repo;

  SocketReceive(this._repo);

  @override
  Future<Either<Failure, bool>> call(Function params) => _repo.receive(params);
}
