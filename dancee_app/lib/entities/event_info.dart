import 'package:vader_app/vader_app.dart';

part 'event_info.freezed.dart';

part 'event_info.g.dart';

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
