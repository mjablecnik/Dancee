import 'dart:io';

import 'package:serinus/serinus.dart';
import 'event_service.dart';

class EventController extends Controller {
  EventController({super.path = '/'}) {
    on(Route.post('/event'), _getEvent);
  }

  Future<dynamic> _getEvent(RequestContext context) async {
    final body = context.body.json;
    if (body == null || body.value['url'] == null) {
      throw BadRequestException(message: 'Invalid request body');
    }
    final url = body.value['url'] as String;
    final eventService = context.use<EventService>();

    context.res.contentType = ContentType.json;

    return await eventService.getEvent(url);
  }
}
