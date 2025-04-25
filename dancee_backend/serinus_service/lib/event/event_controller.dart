import 'dart:io';

import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/api_response.dart';
import 'package:serinus_service/core/error_service.dart';
import 'services/event_service.dart';

class EventController extends Controller {
  EventController({super.path = '/'}) {
    on(Route.post('/event'), _createEvent);
  }

  Future<ApiResponse> _createEvent(RequestContext context) async {
    final url = context.body.formData!.fields['url'] as String;
    final eventService = context.use<EventService>();
    context.res.contentType = ContentType.json;

    try {
      final event = await eventService.getEvent(url);
      await eventService.createEvent(event);

      return SuccessResponse.ok(data: event.toJson());
    } catch (e) {
      final errorService = context.use<ErrorService>();
      await errorService.createError(url, e.toString());

      return ErrorResponse.internalServerError(message: e.toString());
    }
  }
}
