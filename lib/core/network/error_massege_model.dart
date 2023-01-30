// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {
  final int statusCode;
  final String statusMassage;
  final bool success;
  const ErrorMassageModel({
    required this.statusCode,
    required this.statusMassage,
    required this.success,
  });

  factory ErrorMassageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMassageModel(
        statusCode: json['status_Code'],
        statusMassage: json['status_Massage'],
        success: json['success'],
      );
  @override
  List<Object> get props => [statusCode, statusMassage, success];
}
