// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState()';
  }
}

/// @nodoc
class $LoginStateCopyWith<$Res> {
  $LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}

/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _SuccessWithTwoFactor() when successWithTwoFactor != null:
        return successWithTwoFactor(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessWithTwoFactor value) successWithTwoFactor,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Success():
        return success(_that);
      case _SuccessWithTwoFactor():
        return successWithTwoFactor(_that);
      case _Error():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessWithTwoFactor value)? successWithTwoFactor,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _SuccessWithTwoFactor() when successWithTwoFactor != null:
        return successWithTwoFactor(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        success,
    TResult Function(String authId)? successWithTwoFactor,
    TResult Function(String? nip, String? password, String? other)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(
            _that.token, _that.permission, _that.data, _that.refreshToken);
      case _SuccessWithTwoFactor() when successWithTwoFactor != null:
        return successWithTwoFactor(_that.authId);
      case _Error() when error != null:
        return error(_that.nip, _that.password, _that.other);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)
        success,
    required TResult Function(String authId) successWithTwoFactor,
    required TResult Function(String? nip, String? password, String? other)
        error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(
            _that.token, _that.permission, _that.data, _that.refreshToken);
      case _SuccessWithTwoFactor():
        return successWithTwoFactor(_that.authId);
      case _Error():
        return error(_that.nip, _that.password, _that.other);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        success,
    TResult? Function(String authId)? successWithTwoFactor,
    TResult? Function(String? nip, String? password, String? other)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(
            _that.token, _that.permission, _that.data, _that.refreshToken);
      case _SuccessWithTwoFactor() when successWithTwoFactor != null:
        return successWithTwoFactor(_that.authId);
      case _Error() when error != null:
        return error(_that.nip, _that.password, _that.other);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements LoginState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.initial()';
  }
}

/// @nodoc

class _Loading implements LoginState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.loading()';
  }
}

/// @nodoc

class _Success implements LoginState {
  const _Success(this.token, final List<String> permission,
      final Map<String, dynamic> data,
      {this.refreshToken})
      : _permission = permission,
        _data = data;

  final String token;
  final List<String> _permission;
  List<String> get permission {
    if (_permission is EqualUnmodifiableListView) return _permission;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permission);
  }

  final Map<String, dynamic> _data;
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  final String? refreshToken;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      const DeepCollectionEquality().hash(_permission),
      const DeepCollectionEquality().hash(_data),
      refreshToken);

  @override
  String toString() {
    return 'LoginState.success(token: $token, permission: $permission, data: $data, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {String token,
      List<String> permission,
      Map<String, dynamic> data,
      String? refreshToken});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? permission = null,
    Object? data = null,
    Object? refreshToken = freezed,
  }) {
    return _then(_Success(
      null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == permission
          ? _self._permission
          : permission // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _SuccessWithTwoFactor implements LoginState {
  const _SuccessWithTwoFactor(this.authId);

  final String authId;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessWithTwoFactorCopyWith<_SuccessWithTwoFactor> get copyWith =>
      __$SuccessWithTwoFactorCopyWithImpl<_SuccessWithTwoFactor>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuccessWithTwoFactor &&
            (identical(other.authId, authId) || other.authId == authId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authId);

  @override
  String toString() {
    return 'LoginState.successWithTwoFactor(authId: $authId)';
  }
}

/// @nodoc
abstract mixin class _$SuccessWithTwoFactorCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$SuccessWithTwoFactorCopyWith(_SuccessWithTwoFactor value,
          $Res Function(_SuccessWithTwoFactor) _then) =
      __$SuccessWithTwoFactorCopyWithImpl;
  @useResult
  $Res call({String authId});
}

/// @nodoc
class __$SuccessWithTwoFactorCopyWithImpl<$Res>
    implements _$SuccessWithTwoFactorCopyWith<$Res> {
  __$SuccessWithTwoFactorCopyWithImpl(this._self, this._then);

  final _SuccessWithTwoFactor _self;
  final $Res Function(_SuccessWithTwoFactor) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authId = null,
  }) {
    return _then(_SuccessWithTwoFactor(
      null == authId
          ? _self.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Error implements LoginState {
  const _Error({this.nip, this.password, this.other});

  final String? nip;
  final String? password;
  final String? other;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nip, password, other);

  @override
  String toString() {
    return 'LoginState.error(nip: $nip, password: $password, other: $other)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String? nip, String? password, String? other});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = freezed,
    Object? password = freezed,
    Object? other = freezed,
  }) {
    return _then(_Error(
      nip: freezed == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _self.other
          : other // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$LoginEvent {
  String get nip;
  String get password;
  bool get withTwoFactor;
  String? get urlApi;
  OnLoginSuccess? get onLoginSuccess;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      _$LoginEventCopyWithImpl<LoginEvent>(this as LoginEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginEvent &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.withTwoFactor, withTwoFactor) ||
                other.withTwoFactor == withTwoFactor) &&
            (identical(other.urlApi, urlApi) || other.urlApi == urlApi) &&
            (identical(other.onLoginSuccess, onLoginSuccess) ||
                other.onLoginSuccess == onLoginSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nip, password, withTwoFactor, urlApi, onLoginSuccess);

  @override
  String toString() {
    return 'LoginEvent(nip: $nip, password: $password, withTwoFactor: $withTwoFactor, urlApi: $urlApi, onLoginSuccess: $onLoginSuccess)';
  }
}

/// @nodoc
abstract mixin class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) _then) =
      _$LoginEventCopyWithImpl;
  @useResult
  $Res call(
      {String nip,
      String password,
      bool withTwoFactor,
      String? urlApi,
      OnLoginSuccess? onLoginSuccess});
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._self, this._then);

  final LoginEvent _self;
  final $Res Function(LoginEvent) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nip = null,
    Object? password = null,
    Object? withTwoFactor = null,
    Object? urlApi = freezed,
    Object? onLoginSuccess = freezed,
  }) {
    return _then(_self.copyWith(
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      withTwoFactor: null == withTwoFactor
          ? _self.withTwoFactor
          : withTwoFactor // ignore: cast_nullable_to_non_nullable
              as bool,
      urlApi: freezed == urlApi
          ? _self.urlApi
          : urlApi // ignore: cast_nullable_to_non_nullable
              as String?,
      onLoginSuccess: freezed == onLoginSuccess
          ? _self.onLoginSuccess
          : onLoginSuccess // ignore: cast_nullable_to_non_nullable
              as OnLoginSuccess?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submit value) submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit():
        return submit(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submit value)? submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nip, String password, bool withTwoFactor,
            String? urlApi, OnLoginSuccess? onLoginSuccess)?
        submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that.nip, _that.password, _that.withTwoFactor,
            _that.urlApi, _that.onLoginSuccess);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nip, String password, bool withTwoFactor,
            String? urlApi, OnLoginSuccess? onLoginSuccess)
        submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit():
        return submit(_that.nip, _that.password, _that.withTwoFactor,
            _that.urlApi, _that.onLoginSuccess);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nip, String password, bool withTwoFactor,
            String? urlApi, OnLoginSuccess? onLoginSuccess)?
        submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that.nip, _that.password, _that.withTwoFactor,
            _that.urlApi, _that.onLoginSuccess);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Submit implements LoginEvent {
  const _Submit(this.nip, this.password, this.withTwoFactor, this.urlApi,
      {this.onLoginSuccess});

  @override
  final String nip;
  @override
  final String password;
  @override
  final bool withTwoFactor;
  @override
  final String? urlApi;
  @override
  final OnLoginSuccess? onLoginSuccess;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmitCopyWith<_Submit> get copyWith =>
      __$SubmitCopyWithImpl<_Submit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Submit &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.withTwoFactor, withTwoFactor) ||
                other.withTwoFactor == withTwoFactor) &&
            (identical(other.urlApi, urlApi) || other.urlApi == urlApi) &&
            (identical(other.onLoginSuccess, onLoginSuccess) ||
                other.onLoginSuccess == onLoginSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nip, password, withTwoFactor, urlApi, onLoginSuccess);

  @override
  String toString() {
    return 'LoginEvent.submit(nip: $nip, password: $password, withTwoFactor: $withTwoFactor, urlApi: $urlApi, onLoginSuccess: $onLoginSuccess)';
  }
}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) =
      __$SubmitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String nip,
      String password,
      bool withTwoFactor,
      String? urlApi,
      OnLoginSuccess? onLoginSuccess});
}

/// @nodoc
class __$SubmitCopyWithImpl<$Res> implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nip = null,
    Object? password = null,
    Object? withTwoFactor = null,
    Object? urlApi = freezed,
    Object? onLoginSuccess = freezed,
  }) {
    return _then(_Submit(
      null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == withTwoFactor
          ? _self.withTwoFactor
          : withTwoFactor // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == urlApi
          ? _self.urlApi
          : urlApi // ignore: cast_nullable_to_non_nullable
              as String?,
      onLoginSuccess: freezed == onLoginSuccess
          ? _self.onLoginSuccess
          : onLoginSuccess // ignore: cast_nullable_to_non_nullable
              as OnLoginSuccess?,
    ));
  }
}

// dart format on
