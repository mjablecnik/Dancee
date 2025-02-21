// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  DateTime get since => throw _privateConstructorUsedError;
  DateTime get until => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<EventInfo> get info => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      Address address,
      DateTime since,
      DateTime until,
      List<String> tags,
      List<EventInfo> info});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? address = null,
    Object? since = null,
    Object? until = null,
    Object? tags = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      until: null == until
          ? _value.until
          : until // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as List<EventInfo>,
    ) as $Val);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      Address address,
      DateTime since,
      DateTime until,
      List<String> tags,
      List<EventInfo> info});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? address = null,
    Object? since = null,
    Object? until = null,
    Object? tags = null,
    Object? info = null,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
      until: null == until
          ? _value.until
          : until // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      info: null == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as List<EventInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl extends _Event {
  const _$EventImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.address,
      required this.since,
      required this.until,
      required final List<String> tags,
      required final List<EventInfo> info})
      : _tags = tags,
        _info = info,
        super._();

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Address address;
  @override
  final DateTime since;
  @override
  final DateTime until;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<EventInfo> _info;
  @override
  List<EventInfo> get info {
    if (_info is EqualUnmodifiableListView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_info);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.since, since) || other.since == since) &&
            (identical(other.until, until) || other.until == until) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      address,
      since,
      until,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_info));

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event extends Event {
  const factory _Event(
      {required final int id,
      required final String title,
      required final String description,
      required final Address address,
      required final DateTime since,
      required final DateTime until,
      required final List<String> tags,
      required final List<EventInfo> info}) = _$EventImpl;
  const _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  Address get address;
  @override
  DateTime get since;
  @override
  DateTime get until;
  @override
  List<String> get tags;
  @override
  List<EventInfo> get info;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) {
  return _EventInfo.fromJson(json);
}

/// @nodoc
mixin _$EventInfo {
  EventInfoType get type => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this EventInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventInfoCopyWith<EventInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoCopyWith<$Res> {
  factory $EventInfoCopyWith(EventInfo value, $Res Function(EventInfo) then) =
      _$EventInfoCopyWithImpl<$Res, EventInfo>;
  @useResult
  $Res call({EventInfoType type, String key, String value});
}

/// @nodoc
class _$EventInfoCopyWithImpl<$Res, $Val extends EventInfo>
    implements $EventInfoCopyWith<$Res> {
  _$EventInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventInfoType,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventInfoImplCopyWith<$Res>
    implements $EventInfoCopyWith<$Res> {
  factory _$$EventInfoImplCopyWith(
          _$EventInfoImpl value, $Res Function(_$EventInfoImpl) then) =
      __$$EventInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EventInfoType type, String key, String value});
}

/// @nodoc
class __$$EventInfoImplCopyWithImpl<$Res>
    extends _$EventInfoCopyWithImpl<$Res, _$EventInfoImpl>
    implements _$$EventInfoImplCopyWith<$Res> {
  __$$EventInfoImplCopyWithImpl(
      _$EventInfoImpl _value, $Res Function(_$EventInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$EventInfoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventInfoType,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventInfoImpl extends _EventInfo {
  const _$EventInfoImpl(
      {required this.type, required this.key, required this.value})
      : super._();

  factory _$EventInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventInfoImplFromJson(json);

  @override
  final EventInfoType type;
  @override
  final String key;
  @override
  final String value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, key, value);

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      __$$EventInfoImplCopyWithImpl<_$EventInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventInfoImplToJson(
      this,
    );
  }
}

abstract class _EventInfo extends EventInfo {
  const factory _EventInfo(
      {required final EventInfoType type,
      required final String key,
      required final String value}) = _$EventInfoImpl;
  const _EventInfo._() : super._();

  factory _EventInfo.fromJson(Map<String, dynamic> json) =
      _$EventInfoImpl.fromJson;

  @override
  EventInfoType get type;
  @override
  String get key;
  @override
  String get value;

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
