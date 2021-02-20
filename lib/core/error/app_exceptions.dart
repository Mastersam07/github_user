class NetworkException implements Exception {}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class UnknownException implements Exception {
  final String message;

  UnknownException({this.message});
}
