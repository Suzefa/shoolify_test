import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoolify_test/shoolify_test.dart';

class HTTPRequestClient {
  HTTPRequestClient._();

  static final HTTPRequestClient _instance = HTTPRequestClient._();

  factory HTTPRequestClient(){
    return _instance;
  }

  Future<ResponseModel> customRequest(
      String requestType, {
        required String url,
        dynamic requestBody,
        dynamic requestHeader,
      }) async {
    try {
      ResponseModel responseModel = const ResponseModel();
      http.Request request = http.Request(
        requestType,
        Uri.parse(url),
      );
      request.headers.addAll(requestHeader);
      request.body = json.encode(requestBody);
      http.StreamedResponse response = await request.send();
      responseModel = ResponseModel(
        data: jsonDecode(await response.stream.bytesToString()),
        statusCode: response.statusCode,
        responseMessage: response.reasonPhrase ?? "",
      );
      return responseModel;
    }on SocketException catch(socketError) {
      return ResponseModel(
        responseMessage: "Check your internet connection",
        statusCode: 400,
        data: socketError.message,
      );
    } catch (dartError){
      return ResponseModel(
        responseMessage: "Internal Server Error",
        statusCode: 500,
        data: dartError.toString(),
      );
    }
  }
}