import 'package:dancee_shared/entities/venue.dart';
import 'package:dancee_shared/utils.dart';
import 'package:date_time/date_time.dart';
import 'package:vader_core/vader_core.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event extends VaderEntity with _$Event {
  const Event._();

  const factory Event({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: "original_description") required String originalDescription,
    @JsonKey(name: "original_url") required String originalUrl,
    required String organizer,
    required Venue venue,
    @JsonKey(
      fromJson: DateTimeRangeSerialization.fromJsonDateTimeRange,
      toJson: DateTimeRangeSerialization.toJsonDateTimeRange,
      name: 'date_time_range',
    )
    required DateTimeRange dateTimeRange,
    required String timezone,
    @JsonKey(name: 'event_info') required List<EventInfo> info,
    @JsonKey(name: 'event_parts') required List<EventPart> parts,
  }) = _Event;

  Set<String> get tags => parts.fold({}, (e, r) => {...e, ...r.dances});

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);

  Map<String, dynamic> toSurrealQl() {
    final result = toJson();
    result['id'] = _toSurrealUUID(result['id']);
    result['venue'] = _toSurrealVenue(result['venue']);
    result['start_date'] = _toSurrealDateTime(dateTimeRange.start);
    result['end_date'] = _toSurrealDateTime(dateTimeRange.end);
    result['date_time_range'] = null;

    return result;
  }

  factory Event.fromSurrealQl(Map<String, dynamic> map) {
    final result = map;
    result['id'] = result['id'].split('\'')[1];
    //result['venue'] = result['venue'].split('\'')[1];
    //result['venue'] = Venue.fromSurrealQl(map);
    result['date_time_range'] = {
      'start': result['start_date'],
      'end': result['end_date'],
    };

    print(result['venue']);
    return Event.fromJson(result);
  }
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
    @JsonKey(
      fromJson: DateTimeRangeSerialization.fromJsonDateTimeRange,
      toJson: DateTimeRangeSerialization.toJsonDateTimeRange,
      name: 'date_time_range',
    )
    required DateTimeRange dateTimeRange,
    List<String>? lectors,
    List<String>? djs,
  }) = _EventPart;

  factory EventPart.fromJson(Map<String, Object?> json) => _$EventPartFromJson(json);
}

enum EventPartType { party, workshop, openLesson }

String _toSurrealUUID(String uuid) => 'u\'$uuid\'';

String _toSurrealDateTime(DateTime dateTime) => 'd\'${dateTime.toUtc().toIso8601String()}\'';

String _toSurrealVenue(Venue venue) {
  return 'venues:u\'${venue.id}\'';
}
