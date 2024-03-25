import 'package:dartz/dartz.dart';
import '../../../utils/utils.dart';
import '../../domain/domain.dart';
import '../data_sources/datasources.dart';

class SocketRepositoryImpl implements SocketRepository {
  /// Data Source
  final SocketServiceDatasource socketServiceDatasource;

  const SocketRepositoryImpl(this.socketServiceDatasource);

  @override
  Future<Either<Failure, bool>> send(SendApi apiParams) async {
    try {
      final _response = await socketServiceDatasource.send(apiParams);

      // print("_response is: $_response");
      // return Right(_response.toEntity());
      return Right(_response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> receive(Function returnFunction) async {
    try {
      final _response = await socketServiceDatasource.receive(returnFunction);

      print("_response is: $_response");
      // return Right(_response.toEntity());
      return Right(_response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
