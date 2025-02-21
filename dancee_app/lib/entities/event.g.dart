// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      since: DateTime.parse(json['since'] as String),
      until: DateTime.parse(json['until'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      info: (json['info'] as List<dynamic>)
          .map((e) => EventInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'address': instance.address,
      'since': instance.since.toIso8601String(),
      'until': instance.until.toIso8601String(),
      'tags': instance.tags,
      'info': instance.info,
    };

_$EventInfoImpl _$$EventInfoImplFromJson(Map<String, dynamic> json) =>
    _$EventInfoImpl(
      type: $enumDecode(_$EventInfoTypeEnumMap, json['type']),
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$EventInfoImplToJson(_$EventInfoImpl instance) =>
    <String, dynamic>{
      'type': _$EventInfoTypeEnumMap[instance.type]!,
      'key': instance.key,
      'value': instance.value,
    };

const _$EventInfoTypeEnumMap = {
  EventInfoType.text: 'text',
  EventInfoType.url: 'url',
  EventInfoType.price: 'price',
};
