import 'package:dartz/dartz.dart';
import '../../../utils/utils.dart';

abstract class SocketRepository {
  Future<Either<Failure, bool>> send(SendApi apiParams);
  Future<Either<Failure, bool>> receive(Function returnFunction);
}
