// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(dynamic error) failed,
    required TResult Function(List<Event> event) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? failed,
    TResult? Function(List<Event> event)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(dynamic error)? failed,
    TResult Function(List<Event> event)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventListStateInit value) init,
    required TResult Function(EventListStateLoading value) loading,
    required TResult Function(EventListStateFailed value) failed,
    required TResult Function(EventListStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventListStateInit value)? init,
    TResult? Function(EventListStateLoading value)? loading,
    TResult? Function(EventListStateFailed value)? failed,
    TResult? Function(EventListStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventListStateInit value)? init,
    TResult Function(EventListStateLoading value)? loading,
    TResult Function(EventListStateFailed value)? failed,
    TResult Function(EventListStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventListStateCopyWith<$Res> {
  factory $EventListStateCopyWith(
          EventListState value, $Res Function(EventListState) then) =
      _$EventListStateCopyWithImpl<$Res, EventListState>;
}

/// @nodoc
class _$EventListStateCopyWithImpl<$Res, $Val extends EventListState>
    implements $EventListStateCopyWith<$Res> {
  _$EventListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EventListStateInitImplCopyWith<$Res> {
  factory _$$EventListStateInitImplCopyWith(_$EventListStateInitImpl value,
          $Res Function(_$EventListStateInitImpl) then) =
      __$$EventListStateInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventListStateInitImplCopyWithImpl<$Res>
    extends _$EventListStateCopyWithImpl<$Res, _$EventListStateInitImpl>
    implements _$$EventListStateInitImplCopyWith<$Res> {
  __$$EventListStateInitImplCopyWithImpl(_$EventListStateInitImpl _value,
      $Res Function(_$EventListStateInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventListStateInitImpl extends EventListStateInit {
  const _$EventListStateInitImpl() : super._();

  @override
  String toString() {
    return 'EventListState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventListStateInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(dynamic error) failed,
    required TResult Function(List<Event> event) loaded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? failed,
    TResult? Function(List<Event> event)? loaded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(dynamic error)? failed,
    TResult Function(List<Event> event)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventListStateInit value) init,
    required TResult Function(EventListStateLoading value) loading,
    required TResult Function(EventListStateFailed value) failed,
    required TResult Function(EventListStateLoaded value) loaded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventListStateInit value)? init,
    TResult? Function(EventListStateLoading value)? loading,
    TResult? Function(EventListStateFailed value)? failed,
    TResult? Function(EventListStateLoaded value)? loaded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventListStateInit value)? init,
    TResult Function(EventListStateLoading value)? loading,
    TResult Function(EventListStateFailed value)? failed,
    TResult Function(EventListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class EventListStateInit extends EventListState {
  const factory EventListStateInit() = _$EventListStateInitImpl;
  const EventListStateInit._() : super._();
}

/// @nodoc
abstract class _$$EventListStateLoadingImplCopyWith<$Res> {
  factory _$$EventListStateLoadingImplCopyWith(
          _$EventListStateLoadingImpl value,
          $Res Function(_$EventListStateLoadingImpl) then) =
      __$$EventListStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventListStateLoadingImplCopyWithImpl<$Res>
    extends _$EventListStateCopyWithImpl<$Res, _$EventListStateLoadingImpl>
    implements _$$EventListStateLoadingImplCopyWith<$Res> {
  __$$EventListStateLoadingImplCopyWithImpl(_$EventListStateLoadingImpl _value,
      $Res Function(_$EventListStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventListStateLoadingImpl extends EventListStateLoading {
  const _$EventListStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'EventListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventListStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(dynamic error) failed,
    required TResult Function(List<Event> event) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? failed,
    TResult? Function(List<Event> event)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(dynamic error)? failed,
    TResult Function(List<Event> event)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventListStateInit value) init,
    required TResult Function(EventListStateLoading value) loading,
    required TResult Function(EventListStateFailed value) failed,
    required TResult Function(EventListStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventListStateInit value)? init,
    TResult? Function(EventListStateLoading value)? loading,
    TResult? Function(EventListStateFailed value)? failed,
    TResult? Function(EventListStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventListStateInit value)? init,
    TResult Function(EventListStateLoading value)? loading,
    TResult Function(EventListStateFailed value)? failed,
    TResult Function(EventListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EventListStateLoading extends EventListState {
  const factory EventListStateLoading() = _$EventListStateLoadingImpl;
  const EventListStateLoading._() : super._();
}

/// @nodoc
abstract class _$$EventListStateFailedImplCopyWith<$Res> {
  factory _$$EventListStateFailedImplCopyWith(_$EventListStateFailedImpl value,
          $Res Function(_$EventListStateFailedImpl) then) =
      __$$EventListStateFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$EventListStateFailedImplCopyWithImpl<$Res>
    extends _$EventListStateCopyWithImpl<$Res, _$EventListStateFailedImpl>
    implements _$$EventListStateFailedImplCopyWith<$Res> {
  __$$EventListStateFailedImplCopyWithImpl(_$EventListStateFailedImpl _value,
      $Res Function(_$EventListStateFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$EventListStateFailedImpl(
      freezed == error ? _value.error! : error,
    ));
  }
}

/// @nodoc

class _$EventListStateFailedImpl extends EventListStateFailed {
  const _$EventListStateFailedImpl(this.error) : super._();

  @override
  final dynamic error;

  @override
  String toString() {
    return 'EventListState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventListStateFailedImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventListStateFailedImplCopyWith<_$EventListStateFailedImpl>
      get copyWith =>
          __$$EventListStateFailedImplCopyWithImpl<_$EventListStateFailedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(dynamic error) failed,
    required TResult Function(List<Event> event) loaded,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? failed,
    TResult? Function(List<Event> event)? loaded,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(dynamic error)? failed,
    TResult Function(List<Event> event)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventListStateInit value) init,
    required TResult Function(EventListStateLoading value) loading,
    required TResult Function(EventListStateFailed value) failed,
    required TResult Function(EventListStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventListStateInit value)? init,
    TResult? Function(EventListStateLoading value)? loading,
    TResult? Function(EventListStateFailed value)? failed,
    TResult? Function(EventListStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventListStateInit value)? init,
    TResult Function(EventListStateLoading value)? loading,
    TResult Function(EventListStateFailed value)? failed,
    TResult Function(EventListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class EventListStateFailed extends EventListState {
  const factory EventListStateFailed(final dynamic error) =
      _$EventListStateFailedImpl;
  const EventListStateFailed._() : super._();

  dynamic get error;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventListStateFailedImplCopyWith<_$EventListStateFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventListStateLoadedImplCopyWith<$Res> {
  factory _$$EventListStateLoadedImplCopyWith(_$EventListStateLoadedImpl value,
          $Res Function(_$EventListStateLoadedImpl) then) =
      __$$EventListStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Event> event});
}

/// @nodoc
class __$$EventListStateLoadedImplCopyWithImpl<$Res>
    extends _$EventListStateCopyWithImpl<$Res, _$EventListStateLoadedImpl>
    implements _$$EventListStateLoadedImplCopyWith<$Res> {
  __$$EventListStateLoadedImplCopyWithImpl(_$EventListStateLoadedImpl _value,
      $Res Function(_$EventListStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$EventListStateLoadedImpl(
      null == event
          ? _value._event
          : event // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc

class _$EventListStateLoadedImpl extends EventListStateLoaded {
  const _$EventListStateLoadedImpl(final List<Event> event)
      : _event = event,
        super._();

  final List<Event> _event;
  @override
  List<Event> get event {
    if (_event is EqualUnmodifiableListView) return _event;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_event);
  }

  @override
  String toString() {
    return 'EventListState.loaded(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventListStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._event, _event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_event));

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventListStateLoadedImplCopyWith<_$EventListStateLoadedImpl>
      get copyWith =>
          __$$EventListStateLoadedImplCopyWithImpl<_$EventListStateLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(dynamic error) failed,
    required TResult Function(List<Event> event) loaded,
  }) {
    return loaded(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(dynamic error)? failed,
    TResult? Function(List<Event> event)? loaded,
  }) {
    return loaded?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(dynamic error)? failed,
    TResult Function(List<Event> event)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventListStateInit value) init,
    required TResult Function(EventListStateLoading value) loading,
    required TResult Function(EventListStateFailed value) failed,
    required TResult Function(EventListStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventListStateInit value)? init,
    TResult? Function(EventListStateLoading value)? loading,
    TResult? Function(EventListStateFailed value)? failed,
    TResult? Function(EventListStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventListStateInit value)? init,
    TResult Function(EventListStateLoading value)? loading,
    TResult Function(EventListStateFailed value)? failed,
    TResult Function(EventListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EventListStateLoaded extends EventListState {
  const factory EventListStateLoaded(final List<Event> event) =
      _$EventListStateLoadedImpl;
  const EventListStateLoaded._() : super._();

  List<Event> get event;

  /// Create a copy of EventListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventListStateLoadedImplCopyWith<_$EventListStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
