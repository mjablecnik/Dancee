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

  Map<String, dynamic> toSurrealQl() {
    final result = toJson();
    result['id'] = 'u\'$id\'';
    result['coordinates'] = result['coordinates'].toSurrealQl();
    return result;
  }

  factory Venue.fromSurrealQl(Map<String, dynamic> map) {
    final point = map['coordinates']['coordinates'] as List<dynamic>;
    final result = map;
    result['id'] = map['id'].split('\'')[1];
    result['coordinates'] = {'latitude': point[1], 'longitude': point[0]};
    return Venue.fromJson(result);
  }
}

@freezed
class Coordinates extends VaderEntity with _$Coordinates {
  const Coordinates._();

  const factory Coordinates({required double latitude, required double longitude}) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) => _$CoordinatesFromJson(json);

  Map<String, dynamic> toSurrealQl() {
    return {
      "type": "Point",
      "coordinates": [longitude, latitude],
    };
  }
}
