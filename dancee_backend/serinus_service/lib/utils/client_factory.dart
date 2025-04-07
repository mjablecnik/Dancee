import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:serinus_service/config.dart';
import 'package:vader_core/clients/logger.dart';

class ClientFactory {
  static Dio fbServiceClient({String contentType = "application/json", String responseType = "json"}) {
    final dio = Dio();
    dio.options.headers["Content-Type"] = contentType;
    dio.options.baseUrl = ServerConfig.fbServiceUrl;
    dio.options.responseType = ResponseType.values.byName(responseType);
    return dio;
  }
}

class AiClient {
  static Future<Map<String, dynamic>> makeQuery({
    required String rules,
    required String question,
    required String queryName,
  }) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.together.xyz',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ServerConfig.togetherAiSdkKey}',
        },
      ),
    );

    final response = await dio.post(
      '/v1/chat/completions',
      data: {
        'model': ServerConfig.togetherAiSdkModel,
        'stop': ['</s>', '[/INST]'],
        'max_tokens': 3000,
        'temperature': 0.7,
        'top_p': 0.7,
        'top_k': 50,
        'repetition_penalty': 1,
        'messages': [
          {'role': 'system', 'content': rules},
          {'role': 'user', 'content': question},
        ],
      },
    );

    final data = response.data;
    logger.info(queryName + ': ' + data['usage'].toString());
    final String content = data['choices'][0]['message']['content'];

    return jsonDecode(content.replaceAll('```', ''));
  }
}
