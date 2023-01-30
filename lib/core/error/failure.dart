// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String massage;
  const Failure({
    required this.massage,
  });

  @override
  List<Object> get props => [massage];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.massage});
}

class DataBaseFailure extends Failure {
  const DataBaseFailure({required super.massage});
}

class CachFailure extends Failure {
  const CachFailure({required super.massage});
}
