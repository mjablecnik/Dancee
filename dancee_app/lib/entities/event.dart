import 'package:dancee_app/entities/venue.dart';
import 'package:vader_core/vader_core.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event extends VaderEntity with _$Event {
  const Event._();

  const factory Event({
    @JsonKey(toJson: _toJsonUUID) required String id,
    required String title,
    required String description,
    required String organizer,
    @JsonKey(toJson: _toJsonVenue) required Venue venue,
    @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime, name: 'start_date') required DateTime since,
    @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime, name: 'end_date') required DateTime until,
    @JsonKey(name: 'event_info') required List<EventInfo> info,
    @JsonKey(name: 'event_parts') required List<EventPart> parts,
  })= _Event;

  Set<String> get tags => parts.fold({}, (e, r) => {...e, ...r.dances});

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}

@freezed
class EventInfo extends VaderEntity with _$EventInfo {
  const EventInfo._();

  const factory EventInfo({
    required EventInfoType type,
    required String key,
    required String value,
  }) = _EventInfo;

  factory EventInfo.fromJson(Map<String, Object?> json) => _$EventInfoFromJson(json);
}

enum EventInfoType { text, url, price }

@freezed
class EventPart extends VaderEntity with _$EventPart {
  const EventPart._();

  const factory EventPart({
    required String name,
    required EventPartType type,
    required List<String> dances,
    required List<String> lectors,
    required List<String> djs,
  }) = _EventPart;

  factory EventPart.fromJson(Map<String, Object?> json) => _$EventPartFromJson(json);
}

enum EventPartType { party, workshop }



DateTime _fromJsonDateTime(String json) => DateTime.parse(json);
String _toJsonDateTime(DateTime date) => 'd\'${date.toUtc().toIso8601String()}\'';

String _toJsonUUID(String uuid) => 'u\'$uuid\'';

String _toJsonVenue(Venue venue) => 'venues:u\'${venue.id}\'';
