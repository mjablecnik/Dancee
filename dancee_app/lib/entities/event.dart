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
    @JsonKey(name: "Title") required String title,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Organizer") required String organizer,
    @JsonKey(name: "Venue") required Venue venue,
    @JsonKey(name: "StartDate") required DateTime since,
    @JsonKey(name: "EndDate") required DateTime until,
    @JsonKey(name: "EventInfo") required List<EventInfo> info,
    @JsonKey(name: "EventPart") required List<EventPart> part,
  }) = _Event;

  Set<String> get tags => part.fold({}, (e, r) => {...e, ...r.dances});

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
