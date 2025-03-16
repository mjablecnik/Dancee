import 'package:vader_app/vader_app.dart';

part 'event_part.freezed.dart';

part 'event_part.g.dart';

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
