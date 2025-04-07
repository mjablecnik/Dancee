import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class ClientFactory {
  static Dio createHttpClient({
    String? baseUrl,
    String? apiKey,
    String? apiSecret,
    String contentType = "application/json",
    String responseType = "json",
  }) {
    final dio = Dio();
    if (apiKey != null || apiSecret != null) {
      final token = _generateJwt(apiKey!, apiSecret!);
      dio.options.headers["Authorization"] = "Bearer $token";
    }

    dio.options.headers["Content-Type"] = "application/json";
    dio.options.responseType = ResponseType.values.byName(responseType);
    if (baseUrl != null) dio.options.baseUrl = baseUrl;
    return dio;
  }

  static String _generateJwt(String apiKey, String apiSecret) {
    String base64UrlEncode(List<int> data) {
      return base64Url.encode(data).replaceAll('=', '');
    }

    final header = jsonEncode({"alg": "HS256", "typ": "JWT"});
    final payload = jsonEncode({
      "uid": apiKey,
      "exp": DateTime.now().millisecondsSinceEpoch ~/ 1000 + 3600,
      "iat": DateTime.now().millisecondsSinceEpoch ~/ 1000,
    });

    final headerB64 = base64UrlEncode(utf8.encode(header));
    final payloadB64 = base64UrlEncode(utf8.encode(payload));
    final signingInput = "$headerB64.$payloadB64";

    final key = utf8.encode(apiSecret);
    final hmacSha256 = Hmac(sha256, key);
    final signature = hmacSha256.convert(utf8.encode(signingInput));
    final signatureB64 = base64UrlEncode(signature.bytes);

    return "$headerB64.$payloadB64.$signatureB64";
  }
}
