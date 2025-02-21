import 'package:vader_app/vader_app.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  const Address._();

  const factory Address({
    @Default("") String name,
    @Default("") String country,
    @Default("") String number,
    @Default("") @JsonKey(name: 'postal_code') String postalCode,
    @Default("") String street,
    @Default("") String town,
  }) = _Address;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Address.fromJson(Map<String, Object?> json) => _$AddressFromJson(json);
}