import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams extends Equatable {
  @override
  List<Object?> get props => [""];
}
