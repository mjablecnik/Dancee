import 'package:vader_app/vader_app.dart';

part 'event_info.freezed.dart';

part 'event_info.g.dart';

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
