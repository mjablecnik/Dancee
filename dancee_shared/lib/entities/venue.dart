import 'package:vader_core/vader_core.dart';

part 'venue.freezed.dart';

part 'venue.g.dart';

@freezed
class Venue extends VaderEntity with _$Venue {
  const Venue._();

  const factory Venue({
    required String id,
    required String name,
    required String street,
    required String number,
    required String town,
    required String country,
    @JsonKey(name: "postal_code") required String postalCode,
    required Coordinates coordinates,
  }) = _Venue;

  String format([String separator = ', ']) => "$street\u00A0$number$separator$postalCode\u00A0$town";

  factory Venue.fromJson(Map<String, Object?> json) => _$VenueFromJson(json);
}

String _toSurrealUUID(String uuid) => 'u\'$uuid\'';

extension VenueSerialization on Venue {
  Map<String, dynamic> toSurrealQl() {
    final result = toJson();
    result['id'] = _toSurrealUUID(result['id']);
    return result;
  }
}

@freezed
class Coordinates extends VaderEntity with _$Coordinates {
  const Coordinates._();

  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) => _$CoordinatesFromJson(json);
}
