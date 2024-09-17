

abstract class ExceptionsApp implements Exception {
  final String message;

  ExceptionsApp({required this.message});
}


class ServerExeptions extends ExceptionsApp{
  ServerExeptions({required super.message});

}

class DatabaseExceptions extends ExceptionsApp{
  DatabaseExceptions({required super.message});

}