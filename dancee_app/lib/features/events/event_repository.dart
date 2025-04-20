import 'package:dancee_shared/clients/surrealdb_client.dart';
import 'package:dancee_shared/entities.dart';

class EventRepository {
  EventRepository({required this.db});

  final SurrealDB db;

  Future getAllEvents() async {
    var result = await db.query("SELECT *, venues.* FROM events");
    print(result);
  }

  Future<List<Event>> getEvents() async {
    // final response = await httpClient.request(
    //   path: '/events',
    //   method: HttpMethod.get,
    // );
    // return [...response.data["events"].map((e) => Event.fromJson(e))];
    return [];
}