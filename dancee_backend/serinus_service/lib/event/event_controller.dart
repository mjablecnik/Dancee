import 'dart:io';

import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/api_response.dart';
import 'event_service.dart';

class EventController extends Controller {
  EventController({super.path = '/'}) {
    on(Route.post('/event'), _getEvent);
  }

  Future<ApiResponse> _getEvent(RequestContext context) async {
    final body = context.body.json;
    if (body == null || body.value['url'] == null) {
      return ErrorResponse.badRequest(message: 'Invalid request body');
    }

    final url = body.value['url'] as String;
    final eventService = context.use<EventService>();

    context.res.contentType = ContentType.json;

    try {
      final event = await eventService.getEvent(url);
      return SuccessResponse.ok(data: event.toJson());
    } catch (e) {
      return ErrorResponse.notFound(message: e.toString());
    }
  }
}
