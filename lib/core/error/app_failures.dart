import 'app_exceptions.dart';

abstract class ActionFailure {
  final Object properties;
  ActionFailure([this.properties = const Object()]) : super();
  List<Object> get props => [properties];
}

class NetworkFailure extends ActionFailure {}

class ServerFailure extends ActionFailure {
  final String message;

  ServerFailure(this.message);
}

class UnknownFailure extends ActionFailure {}

ActionFailure handleException(Exception e) {
  if (e is ServerException)
    return ServerFailure(e.message);
  else if (e is NetworkException)
    return NetworkFailure();
  else
    return UnknownFailure();
}
