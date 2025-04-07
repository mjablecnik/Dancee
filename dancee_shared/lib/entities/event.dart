import 'dart:convert';

import 'package:dancee_shared/entities/venue.dart';
import 'package:date_time/date_time.dart';
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
    required String originalDescription,
    required String originalUrl,
    required String organizer,
    @JsonKey(toJson: _toJsonVenue) required Venue venue,
    @JsonKey(fromJson: _fromJsonDateTimeRange, toJson: _toJsonDateTimeRange, name: 'date_time_range')
    required DateTimeRange dateTimeRange,
    @JsonKey(name: 'event_info') required List<EventInfo> info,
    @JsonKey(name: 'event_parts') required List<EventPart> parts,
  }) = _Event;

  Set<String> get tags => parts.fold({}, (e, r) => {...e, ...r.dances});

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}

@freezed
class EventInfo extends VaderEntity with _$EventInfo {
  const EventInfo._();

  const factory EventInfo({required EventInfoType type, required String key, required String value}) = _EventInfo;

  factory EventInfo.fromJson(Map<String, Object?> json) => _$EventInfoFromJson(json);
}

enum EventInfoType { text, url, price }

@freezed
class EventPart extends VaderEntity with _$EventPart {
  const EventPart._();

  const factory EventPart({
    required String name,
    String? description,
    required EventPartType type,
    required List<String> dances,
    @JsonKey(fromJson: _fromJsonDateTimeRange, toJson: _toJsonDateTimeRange, name: 'date_time_range')
    required DateTimeRange dateTimeRange,
    List<String>? lectors,
    List<String>? djs,
  }) = _EventPart;

  factory EventPart.fromJson(Map<String, Object?> json) => _$EventPartFromJson(json);
}

enum EventPartType { party, workshop }

DateTimeRange _fromJsonDateTimeRange(String json) {
  Map<String, String> map = jsonDecode(json);
  return DateTimeRange(start: DateTime.parse(map["start"]!), end: DateTime.parse(map["end"]!));
}

Map<String, Object?> _toJsonDateTimeRange(DateTimeRange date) {
  return {"start": date.start.toUtc().toIso8601String(), "end": date.end.toUtc().toIso8601String()};
}

String _toJsonUUID(String uuid) => 'u\'$uuid\'';

String _toJsonVenue(Venue venue) => 'venues:u\'${venue.id}\'';
