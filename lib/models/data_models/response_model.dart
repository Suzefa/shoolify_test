import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {

  final String responseMessage;
  final int statusCode;
  final dynamic data;

  const ResponseModel({
    this.statusCode = -1,
    this.responseMessage = "",
    this.data,
  });

  ResponseModel fromJson(Map<String,dynamic> json){
    return ResponseModel(
      statusCode: json["statusCode"] ?? -1,
      responseMessage: json["responseMessage"] ?? "",
      data: json["data"],
    );
  }

  @override
  List<Object?> get props => [
    responseMessage,
    statusCode,
    data,
  ];

  @override
  String toString() {
    return 'ResponseModel{responseMessage: $responseMessage, statusCode: $statusCode, data: $data}';
  }
}