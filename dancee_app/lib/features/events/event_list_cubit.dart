import 'package:dancee_app/entities/event.dart';
import 'package:dancee_app/features/events/event_list_state.dart';
import 'package:dancee_app/features/events/event_repository.dart';
import 'package:vader_app/vader_app.dart';

class EventListCubit extends Cubit<EventListState> {
  EventListCubit({required this.eventRepository}) : super(EventListState.init()) {
    init();
  }

  late final EventRepository eventRepository;

  //update(EventListState state) {
  //  emit(state);
  //}

  init() => reload();

  Future<void> reload() async {
    try {
      emit(EventListState.loading());
      emit(EventListState.loaded(await eventRepository.getEvents()));
    } catch (e) {
      emit(EventListState.failed(e));
    }
  }
}
