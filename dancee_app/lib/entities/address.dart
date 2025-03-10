import 'package:vader_app/vader_app.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  const Address._();

  const factory Address({
    String name,
    String street,
    String number,
    String town,
    String country,
    String postalCode,
  }) = _Address;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Address.fromJson(Map<String, Object?> json) => _$AddressFromJson(json);
}