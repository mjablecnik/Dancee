// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserStateInitImplCopyWith<$Res> {
  factory _$$UserStateInitImplCopyWith(
          _$UserStateInitImpl value, $Res Function(_$UserStateInitImpl) then) =
      __$$UserStateInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserStateInitImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateInitImpl>
    implements _$$UserStateInitImplCopyWith<$Res> {
  __$$UserStateInitImplCopyWithImpl(
      _$UserStateInitImpl _value, $Res Function(_$UserStateInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserStateInitImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserStateInitImpl extends UserStateInit {
  const _$UserStateInitImpl([this.user]) : super._();

  @override
  final User? user;

  @override
  String toString() {
    return 'UserState.init(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateInitImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateInitImplCopyWith<_$UserStateInitImpl> get copyWith =>
      __$$UserStateInitImplCopyWithImpl<_$UserStateInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return init(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return init?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class UserStateInit extends UserState {
  const factory UserStateInit([final User? user]) = _$UserStateInitImpl;
  const UserStateInit._() : super._();

  User? get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateInitImplCopyWith<_$UserStateInitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateLoadingImplCopyWith<$Res> {
  factory _$$UserStateLoadingImplCopyWith(_$UserStateLoadingImpl value,
          $Res Function(_$UserStateLoadingImpl) then) =
      __$$UserStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateLoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoadingImpl>
    implements _$$UserStateLoadingImplCopyWith<$Res> {
  __$$UserStateLoadingImplCopyWithImpl(_$UserStateLoadingImpl _value,
      $Res Function(_$UserStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserStateLoadingImpl extends UserStateLoading {
  const _$UserStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
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
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoading extends UserState {
  const factory UserStateLoading() = _$UserStateLoadingImpl;
  const UserStateLoading._() : super._();
}

/// @nodoc
abstract class _$$UserStateFailureImplCopyWith<$Res> {
  factory _$$UserStateFailureImplCopyWith(_$UserStateFailureImpl value,
          $Res Function(_$UserStateFailureImpl) then) =
      __$$UserStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$$UserStateFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateFailureImpl>
    implements _$$UserStateFailureImplCopyWith<$Res> {
  __$$UserStateFailureImplCopyWithImpl(_$UserStateFailureImpl _value,
      $Res Function(_$UserStateFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UserStateFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$UserStateFailureImpl extends UserStateFailure {
  const _$UserStateFailureImpl(this.error) : super._();

  @override
  final Exception error;

  @override
  String toString() {
    return 'UserState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateFailureImplCopyWith<_$UserStateFailureImpl> get copyWith =>
      __$$UserStateFailureImplCopyWithImpl<_$UserStateFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UserStateFailure extends UserState {
  const factory UserStateFailure(final Exception error) =
      _$UserStateFailureImpl;
  const UserStateFailure._() : super._();

  Exception get error;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateFailureImplCopyWith<_$UserStateFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateSuccessImplCopyWith<$Res> {
  factory _$$UserStateSuccessImplCopyWith(_$UserStateSuccessImpl value,
          $Res Function(_$UserStateSuccessImpl) then) =
      __$$UserStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserStateSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateSuccessImpl>
    implements _$$UserStateSuccessImplCopyWith<$Res> {
  __$$UserStateSuccessImplCopyWithImpl(_$UserStateSuccessImpl _value,
      $Res Function(_$UserStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserStateSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserStateSuccessImpl extends UserStateSuccess {
  const _$UserStateSuccessImpl(this.user) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateSuccessImplCopyWith<_$UserStateSuccessImpl> get copyWith =>
      __$$UserStateSuccessImplCopyWithImpl<_$UserStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UserStateSuccess extends UserState {
  const factory UserStateSuccess(final User user) = _$UserStateSuccessImpl;
  const UserStateSuccess._() : super._();

  User get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateSuccessImplCopyWith<_$UserStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateLoggedInImplCopyWith<$Res> {
  factory _$$UserStateLoggedInImplCopyWith(_$UserStateLoggedInImpl value,
          $Res Function(_$UserStateLoggedInImpl) then) =
      __$$UserStateLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserStateLoggedInImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoggedInImpl>
    implements _$$UserStateLoggedInImplCopyWith<$Res> {
  __$$UserStateLoggedInImplCopyWithImpl(_$UserStateLoggedInImpl _value,
      $Res Function(_$UserStateLoggedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserStateLoggedInImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserStateLoggedInImpl extends UserStateLoggedIn {
  const _$UserStateLoggedInImpl(this.user) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateLoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateLoggedInImplCopyWith<_$UserStateLoggedInImpl> get copyWith =>
      __$$UserStateLoggedInImplCopyWithImpl<_$UserStateLoggedInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class UserStateLoggedIn extends UserState {
  const factory UserStateLoggedIn(final User user) = _$UserStateLoggedInImpl;
  const UserStateLoggedIn._() : super._();

  User get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateLoggedInImplCopyWith<_$UserStateLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateLoggedOutImplCopyWith<$Res> {
  factory _$$UserStateLoggedOutImplCopyWith(_$UserStateLoggedOutImpl value,
          $Res Function(_$UserStateLoggedOutImpl) then) =
      __$$UserStateLoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateLoggedOutImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoggedOutImpl>
    implements _$$UserStateLoggedOutImplCopyWith<$Res> {
  __$$UserStateLoggedOutImplCopyWithImpl(_$UserStateLoggedOutImpl _value,
      $Res Function(_$UserStateLoggedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserStateLoggedOutImpl extends UserStateLoggedOut {
  const _$UserStateLoggedOutImpl() : super._();

  @override
  String toString() {
    return 'UserState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateLoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) init,
    required TResult Function() loading,
    required TResult Function(Exception error) failure,
    required TResult Function(User user) success,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? init,
    TResult? Function()? loading,
    TResult? Function(Exception error)? failure,
    TResult? Function(User user)? success,
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? init,
    TResult Function()? loading,
    TResult Function(Exception error)? failure,
    TResult Function(User user)? success,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInit value) init,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateFailure value) failure,
    required TResult Function(UserStateSuccess value) success,
    required TResult Function(UserStateLoggedIn value) loggedIn,
    required TResult Function(UserStateLoggedOut value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateInit value)? init,
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateFailure value)? failure,
    TResult? Function(UserStateSuccess value)? success,
    TResult? Function(UserStateLoggedIn value)? loggedIn,
    TResult? Function(UserStateLoggedOut value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInit value)? init,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateFailure value)? failure,
    TResult Function(UserStateSuccess value)? success,
    TResult Function(UserStateLoggedIn value)? loggedIn,
    TResult Function(UserStateLoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class UserStateLoggedOut extends UserState {
  const factory UserStateLoggedOut() = _$UserStateLoggedOutImpl;
  const UserStateLoggedOut._() : super._();
}
