import 'package:ai_clients/ai_clients.dart';
import 'package:dio/dio.dart';
import 'package:serinus/serinus.dart';
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

abstract class IAiClient extends Provider {
  Future<Map<String, dynamic>> query({required String rules, required String question, required String queryName});
}

class DanceeAiClient extends IAiClient {
  DanceeAiClient() : aiClient = AiClients.gemini(apiKey: ServerConfig.geminiApiKey, delay: Duration(seconds: 10));

  final GeminiClient aiClient;

  Future<Map<String, dynamic>> query({
    required String rules,
    required String question,
    required String queryName,
  }) async {
    try {
      final String response = await aiClient.simpleQuery(system: rules, prompt: question);
      //print(response);
      final result = jsonDecode(response.replaceAll('\\\n', '\\n').replaceAll('```json', '').replaceAll('```', ''));
      //print(result);
      return result;
    } catch (e) {
      logger.error("Cannot make AI query");
      logger.error(e.toString());
      rethrow;
    }
  }
}
