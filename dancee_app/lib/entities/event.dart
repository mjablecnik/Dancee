import 'package:dancee_app/entities/venue.dart';
import 'package:vader_app/vader_app.dart';

import 'event_info.dart';
import 'event_part.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event extends VaderEntity with _$Event {
  const Event._();

  const factory Event({
    required int id,
    required String title,
    required String description,
    required String organizer,
    required Venue venue,
    required DateTime since,
    required DateTime until,
    required List<EventInfo> info,
    required List<EventPart> part,
  }) = _Event;

  Set<String> get tags => part.fold({}, (e, r) => {...e, ...r.dances});

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
