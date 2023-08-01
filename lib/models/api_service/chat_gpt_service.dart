import 'package:shoolify_test/shoolify_test.dart';

class ChatGPTService {
  ChatGPTService._();

  static final ChatGPTService _instance = ChatGPTService._();

  factory ChatGPTService(){
    return _instance;
  }

  final HTTPRequestClient _httpRequestClient = HTTPRequestClient();

  Future<dynamic> askToGPT({required String question}) async {
    Map<String,dynamic> requestBody = {
      "model": "text-davinci-003",
      "prompt": question,
      "max_tokens": 250,
      "temperature": 0,
      "top_p": 1
    };
    ResponseModel responseModel = await _httpRequestClient.customRequest(
      "POST",
      url: WebServiceUrl.kGPTUrl,
      requestHeader: {
        'Authorization': 'Bearer ${dotenv.env["gptToken"]}',
        'Content-Type': 'application/json'
      },
      requestBody: requestBody,
    );
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230) {
      return responseModel.data["choices"][0]["text"];
    } else {
      return {
        "message" : responseModel.responseMessage,
      };
    }
  }
}