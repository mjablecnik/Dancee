import 'package:vader_app/vader_app.dart';

part 'venue.freezed.dart';

part 'venue.g.dart';

@freezed
class Venue with _$Venue {
  const Venue._();

  const factory Venue({
    required String name,
    required String street,
    required String number,
    required String town,
    required String country,
    required String postalCode,
  }) = _Venue;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Venue.fromJson(Map<String, Object?> json) => _$VenueFromJson(json);
}