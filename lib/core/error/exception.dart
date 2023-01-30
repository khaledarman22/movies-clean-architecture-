import 'package:moves/core/network/error_massege_model.dart';

class ServerException implements Exception {
  final ErrorMassageModel errorMassageModel;
  ServerException({
    required this.errorMassageModel,
  });
}
