import 'package:vader_app/vader_app.dart';

part 'venue.freezed.dart';

part 'venue.g.dart';

@freezed
class Venue with _$Venue {
  const Venue._();

  const factory Venue({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Street") required String street,
    @JsonKey(name: "Number") required String number,
    @JsonKey(name: "Town") required String town,
    @JsonKey(name: "Country") required String country,
    @JsonKey(name: "PostalCode") required String postalCode,
  }) = _Venue;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Venue.fromJson(Map<String, Object?> json) => _$VenueFromJson(json);
}