import 'package:dancee_app/config.dart';
import 'package:dancee_shared/entities.dart';
import 'package:dio/dio.dart';

class EventRepository {
  Future<List<Event>> getEvents() async {
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig().apiUrl,
        connectTimeout: const Duration(seconds: 5),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    final response = await _dio.get('/event/list');
    return [
      ...response.data["data"].map((e) => Event.fromJson(e)),
    ];
  }
}
