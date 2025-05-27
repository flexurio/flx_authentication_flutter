// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoginState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, List<String> permission, Map<String, dynamic> data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? permission = null,
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == permission
          ? _value._permission
          : permission // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.token, final List<String> permission,
      final Map<String, dynamic> data)
      : _permission = permission,
        _data = data;

  @override
  final String token;
  final List<String> _permission;
  @override
  List<String> get permission {
    if (_permission is EqualUnmodifiableListView) return _permission;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permission);
  }

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'LoginState.success(token: $token, permission: $permission, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      const DeepCollectionEquality().hash(_permission),
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    return success(token, permission, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    return success?.call(token, permission, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(token, permission, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements LoginState {
  const factory _Success(final String token, final List<String> permission,
      final Map<String, dynamic> data) = _$SuccessImpl;

  String get token;
  List<String> get permission;
  Map<String, dynamic> get data;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessWithTwoFactorImplCopyWith<$Res> {
  factory _$$SuccessWithTwoFactorImplCopyWith(_$SuccessWithTwoFactorImpl value,
          $Res Function(_$SuccessWithTwoFactorImpl) then) =
      __$$SuccessWithTwoFactorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String authId});
}

/// @nodoc
class __$$SuccessWithTwoFactorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$SuccessWithTwoFactorImpl>
    implements _$$SuccessWithTwoFactorImplCopyWith<$Res> {
  __$$SuccessWithTwoFactorImplCopyWithImpl(_$SuccessWithTwoFactorImpl _value,
      $Res Function(_$SuccessWithTwoFactorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
  }) {
    return _then(_$SuccessWithTwoFactorImpl(
      null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessWithTwoFactorImpl implements _SuccessWithTwoFactor {
  const _$SuccessWithTwoFactorImpl(this.authId);

  @override
  final String authId;

  @override
  String toString() {
    return 'LoginState.successWithTwoFactor(authId: $authId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithTwoFactorImpl &&
            (identical(other.authId, authId) || other.authId == authId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authId);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessWithTwoFactorImplCopyWith<_$SuccessWithTwoFactorImpl>
      get copyWith =>
          __$$SuccessWithTwoFactorImplCopyWithImpl<_$SuccessWithTwoFactorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    return successWithTwoFactor(authId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    return successWithTwoFactor?.call(authId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) {
    if (successWithTwoFactor != null) {
      return successWithTwoFactor(authId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    return successWithTwoFactor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    return successWithTwoFactor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successWithTwoFactor != null) {
      return successWithTwoFactor(this);
    }
    return orElse();
  }
}

abstract class _SuccessWithTwoFactor implements LoginState {
  const factory _SuccessWithTwoFactor(final String authId) =
      _$SuccessWithTwoFactorImpl;

  String get authId;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessWithTwoFactorImplCopyWith<_$SuccessWithTwoFactorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? nip, String? password, String? other});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = freezed,
    Object? password = freezed,
    Object? other = freezed,
  }) {
    return _then(_$ErrorImpl(
      nip: freezed == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({this.nip, this.password, this.other});

  @override
  final String? nip;
  @override
  final String? password;
  @override
  final String? other;

  @override
  String toString() {
    return 'LoginState.error(nip: $nip, password: $password, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nip, password, other);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    return error(nip, password, other);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    return error?.call(nip, password, other);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String token, List<String> permission, Map<String, dynamic> data)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(nip, password, other);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LoginState {
  const factory _Error(
      {final String? nip,
      final String? password,
      final String? other}) = _$ErrorImpl;

  String? get nip;
  String? get password;
  String? get other;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginEvent {
  String get nip => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get withTwoFactor => throw _privateConstructorUsedError;
  String? get urlApi => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String nip, String password, bool withTwoFactor, String? urlApi)
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String nip, String password, bool withTwoFactor, String? urlApi)?
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String nip, String password, bool withTwoFactor, String? urlApi)?
        submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call({String nip, String password, bool withTwoFactor, String? urlApi});
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? password = null,
    Object? withTwoFactor = null,
    Object? urlApi = freezed,
  }) {
    return _then(_value.copyWith(
      nip: null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      withTwoFactor: null == withTwoFactor
          ? _value.withTwoFactor
          : withTwoFactor // ignore: cast_nullable_to_non_nullable
              as bool,
      urlApi: freezed == urlApi
          ? _value.urlApi
          : urlApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nip, String password, bool withTwoFactor, String? urlApi});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? password = null,
    Object? withTwoFactor = null,
    Object? urlApi = freezed,
  }) {
    return _then(_$SubmitImpl(
      null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == withTwoFactor
          ? _value.withTwoFactor
          : withTwoFactor // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == urlApi
          ? _value.urlApi
          : urlApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(this.nip, this.password, this.withTwoFactor, this.urlApi);

  @override
  final String nip;
  @override
  final String password;
  @override
  final bool withTwoFactor;
  @override
  final String? urlApi;

  @override
  String toString() {
    return 'LoginEvent.submit(nip: $nip, password: $password, withTwoFactor: $withTwoFactor, urlApi: $urlApi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.withTwoFactor, withTwoFactor) ||
                other.withTwoFactor == withTwoFactor) &&
            (identical(other.urlApi, urlApi) || other.urlApi == urlApi));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nip, password, withTwoFactor, urlApi);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String nip, String password, bool withTwoFactor, String? urlApi)
        submit,
  }) {
    return submit(nip, password, withTwoFactor, urlApi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String nip, String password, bool withTwoFactor, String? urlApi)?
        submit,
  }) {
    return submit?.call(nip, password, withTwoFactor, urlApi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String nip, String password, bool withTwoFactor, String? urlApi)?
        submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(nip, password, withTwoFactor, urlApi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements LoginEvent {
  const factory _Submit(final String nip, final String password,
      final bool withTwoFactor, final String? urlApi) = _$SubmitImpl;

  @override
  String get nip;
  @override
  String get password;
  @override
  bool get withTwoFactor;
  @override
  String? get urlApi;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
