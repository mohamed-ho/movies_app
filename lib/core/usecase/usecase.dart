import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class Usecase<Type, Parameter> {
  Future<Either<FailureApp, Type>> call(Parameter parameter);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
