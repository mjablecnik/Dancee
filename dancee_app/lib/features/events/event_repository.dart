import 'package:dancee_app/config.dart';
import 'package:dancee_shared/entities.dart';
import 'package:dio/dio.dart';

class EventRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig().apiUrl,
      connectTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<Event>> getEvents({attempts = 3}) async {
    try {
      final response = await _dio.get('/event/list');
      if (response.statusCode == 200 && response.data.containsKey("data")) {
        return [
          ...response.data["data"].map((e) => Event.fromJson(e)),
        ];
      } else if (attempts > 0) {
        await Future.delayed(const Duration(seconds: 1));
        return getEvents(attempts: --attempts);
      } else {
        throw Exception("Failed to get events");
      }
    } catch (e) {
      if (attempts > 0) {
        await Future.delayed(const Duration(seconds: 1));
        return getEvents(attempts: --attempts);
      } else {
        rethrow;
      }
    }
  }
}
