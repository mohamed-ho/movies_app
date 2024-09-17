import 'package:equatable/equatable.dart';

abstract class FailureApp implements Equatable {
  final String message;
  FailureApp({required this.message});
  @override
  List<Object?> get props => [message];
    @override
  bool? get stringify => throw UnimplementedError();
}


class ServerFailure extends FailureApp{
  ServerFailure({required super.message});
}

class DatabaseFailure extends FailureApp {
  DatabaseFailure({required super.message});

}