import 'package:dancee_app/features/app/app_module.dart';
import 'package:dancee_app/features/events/event_repository.dart';
import 'package:dancee_app/features/events/logic/event_list_cubit.dart';
import 'package:dancee_app/features/events/pages/event_detail_page.dart';
import 'package:dancee_app/features/events/pages/event_list_page.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

class EventModule extends AppModule {
  @override
  List<GoRoute> get routes => EventRoutes.routes;

  @override
  Injector? get services {
    return super.services!
      ..add(EventRepository.new)
      ..add(EventListCubit.new)
      ..commit();
  }
}

enum EventRoutes {
  eventList(EventListPage()),
  eventDetail(EventDetailPage());

  const EventRoutes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/event';

  get path => '$routePath/$name';

  static List<GoRoute> get routes => [
    Routes.route(routePath, EventRoutes.eventList._page),
    Routes.route(routePath, EventRoutes.eventDetail._page),
  ];
}
