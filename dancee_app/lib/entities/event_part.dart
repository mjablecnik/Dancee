import 'package:vader_app/vader_app.dart';

part 'event_part.freezed.dart';

part 'event_part.g.dart';

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
