import 'package:dancee_app/features/events/logic/event_all_list_cubit.dart';
import 'package:dancee_app/features/events/logic/event_list_state.dart';
import 'package:dancee_shared/entities/event.dart';
import 'package:vader_app/vader_app.dart';

class EventFilteredListCubit extends Cubit<EventListState> {
  EventFilteredListCubit({required this.eventListCubit}) : super(EventListState.loading()) {
    init();
  }

  late final EventAllListCubit eventListCubit;

  init() => reload();

  Future<void> reload() async {
    try {
      emit(EventListState.loading());
      await eventListCubit.init();
      if (eventListCubit.state is EventListStateLoadedAll) {
        final allEvents = (eventListCubit.state as EventListStateLoadedAll).events;
        emit(EventListState.loaded(allEvents));
      }
    } catch (e) {
      emit(EventListState.failed(e));
    }
  }

  filterByRegion(String region) {
    try {
      if (eventListCubit.state is EventListStateLoadedAll) {
        final loadedEvents = (eventListCubit.state as EventListStateLoadedAll).events;
        List<Event> filteredEvents;
        if (region == 'All') {
          filteredEvents = loadedEvents.where((Event event) => event.venue?.region != 'Other').toList();
        } else {
          filteredEvents = loadedEvents.where((Event event) => event.venue?.region == region).toList();
        }
        emit(EventListState.loaded(filteredEvents));
      }
    } catch (e) {
      emit(EventListState.failed(e));
    }
  }
}
