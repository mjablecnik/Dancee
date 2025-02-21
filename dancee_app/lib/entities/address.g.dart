// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['name'] as String? ?? "",
      country: json['country'] as String? ?? "",
      number: json['number'] as String? ?? "",
      postalCode: json['postal_code'] as String? ?? "",
      street: json['street'] as String? ?? "",
      town: json['town'] as String? ?? "",
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'number': instance.number,
      'postal_code': instance.postalCode,
      'street': instance.street,
      'town': instance.town,
    };
