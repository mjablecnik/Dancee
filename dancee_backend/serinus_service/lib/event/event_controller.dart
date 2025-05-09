import 'dart:io';

import 'package:dancee_shared/entities/event.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_service/core/api_response.dart';
import 'package:serinus_service/core/error_service.dart';
import 'package:serinus_service/event/repositories/event_repository.dart';
import 'package:serinus_service/groups/groups_repository.dart';
import 'package:serinus_service/vader_server.dart';
import 'package:vader_core/clients/logger.dart';
import 'services/event_service.dart';

class EventController extends Controller {
  EventController({super.path = '/event'}) {
    on(Route.post('/'), _createEvent);
    on(Route.get('/process'), _processEvents);
    on(Route.get('/list'), _listEvents);
  }

  Future<ApiResponse> _createEvent(RequestContext context) async {
    final url = context.body.formData!.fields['url'] as String;
    final eventService = injector.use<EventService>();
    context.res.contentType = ContentType.json;

    try {
      final event = await eventService.getEvent(url);
      await eventService.createEvent(event);

      return SuccessResponse.ok(data: event.toJson());
    } catch (e) {
      final errorService = injector.use<ErrorService>();
      await errorService.createError(url, e.toString());

      return ErrorResponse.internalServerError(message: e.toString());
    }
  }

  Future<ApiResponse> _listEvents(RequestContext context) async {
    try {
      final eventRepository = injector.use<EventRepository>();
      context.res.contentType = ContentType.json;
      final allEvents = await eventRepository.selectAllEvents();
      return SuccessResponse.ok(data: allEvents);
    } catch (e) {
      return ErrorResponse.internalServerError(message: e.toString());
    }
  }

  Future<ApiResponse> _processEvents(RequestContext context) async {
    final groupsRepository = injector.use<GroupsRepository>();
    final eventService = injector.use<EventService>();
    final errorService = injector.use<ErrorService>();
    final eventRepository = injector.use<EventRepository>();

    final allGroupUrls = await groupsRepository.getAllGroups();
    print(allGroupUrls);

    for (final groupUrl in allGroupUrls) {
      final eventLinks = await eventService.getEventListUrlFromFacebook(groupUrl);
      for (final eventLink in eventLinks) {
        try {
          if (await eventRepository.existsEventByOriginalUrl(eventLink)) continue;
          final Event event = await eventService.getEvent(eventLink);
          await eventService.createEvent(event);
        } catch (e) {
          await errorService.createError(eventLink, e.toString());
          logger.error("Cannot save event: " + eventLink);
          logger.error(e.toString());
        }
      }
      await groupsRepository.updateGroup(groupUrl);
    }
    return SuccessResponse.ok();
  }
}
