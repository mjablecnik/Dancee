import 'package:vader_core/vader_core.dart';

part 'venue.freezed.dart';

part 'venue.g.dart';

@freezed
class Venue with _$Venue {
  const Venue._();

  const factory Venue({
    @JsonKey(toJson: _toJsonUUID) required String id,
    required String name,
    required String street,
    required String number,
    required String town,
    required String country,
    @JsonKey(name: "postal_code") required String postalCode,
  }) = _Venue;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Venue.fromJson(Map<String, Object?> json) => _$VenueFromJson(json);
}

String _toJsonUUID(String uuid) => 'u\'$uuid\'';
