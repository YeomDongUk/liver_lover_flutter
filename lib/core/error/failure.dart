import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class QueryFailure extends Failure {
  const QueryFailure();
}

class CreateFailure extends Failure {
  const CreateFailure();
}
