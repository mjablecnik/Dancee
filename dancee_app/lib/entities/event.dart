import 'package:dancee_app/entities/address.dart';
import 'package:vader_app/vader_app.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event extends VaderEntity with _$Event {
  const Event._();

  const factory Event({
    required int id,
    required String title,
    required String description,
    required Address address,
    required DateTime since,
    required DateTime until,
    required List<String> tags,
    required List<EventInfo> info,
  }) = _Event;

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
