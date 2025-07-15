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
      return [
        ...response.data["data"].map((e) => Event.fromJson(e)),
      ];
    } catch (e) {
      if (attempts > 0) {
        return getEvents(attempts: --attempts);
      } else {
        rethrow;
      }
    }
  }
}
