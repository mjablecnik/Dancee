import 'package:dancee_app/entities/venue.dart';
import 'package:vader_app/vader_app.dart';

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

@freezed
class EventInfo extends VaderEntity with _$EventInfo {
  const EventInfo._();

  const factory EventInfo({
    @JsonKey(name: "Type") required EventInfoType type,
    @JsonKey(name: "Key") required String key,
    @JsonKey(name: "Value") required String value,
  }) = _EventInfo;

  factory EventInfo.fromJson(Map<String, Object?> json) => _$EventInfoFromJson(json);
}

enum EventInfoType { text, url, price }

@freezed
class EventPart extends VaderEntity with _$EventPart {
  const EventPart._();

  const factory EventPart({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Type") required EventPartType type,
    @JsonKey(name: "DanceStyle") required List<String> dances,
    @JsonKey(name: "Lectors") required List<String> lectors,
    @JsonKey(name: "DJs") required List<String> djs,
  }) = _EventPart;

  factory EventPart.fromJson(Map<String, Object?> json) => _$EventPartFromJson(json);
}

enum EventPartType { party, workshop }
