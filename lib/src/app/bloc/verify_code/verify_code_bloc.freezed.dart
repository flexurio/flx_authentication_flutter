// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyCodeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VerifyCodeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerifyCodeState()';
  }
}

/// @nodoc
class $VerifyCodeStateCopyWith<$Res> {
  $VerifyCodeStateCopyWith(
      VerifyCodeState _, $Res Function(VerifyCodeState) __);
}

/// Adds pattern-matching-related methods to [VerifyCodeState].
extension VerifyCodeStatePatterns on VerifyCodeState {
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
    TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data)?
        success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.accessToken, _that.permission, _that.data);
      case _Error() when error != null:
        return error(_that.error);
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
    required TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data)
        success,
    required TResult Function(String error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.accessToken, _that.permission, _that.data);
      case _Error():
        return error(_that.error);
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
    TResult? Function(String accessToken, List<String> permission,
            Map<String, dynamic> data)?
        success,
    TResult? Function(String error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.accessToken, _that.permission, _that.data);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements VerifyCodeState {
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
    return 'VerifyCodeState.initial()';
  }
}

/// @nodoc

class _Loading implements VerifyCodeState {
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
    return 'VerifyCodeState.loading()';
  }
}

/// @nodoc

class _Success implements VerifyCodeState {
  const _Success(this.accessToken, final List<String> permission,
      final Map<String, dynamic> data)
      : _permission = permission,
        _data = data;

  final String accessToken;
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

  /// Create a copy of VerifyCodeState
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
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      const DeepCollectionEquality().hash(_permission),
      const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'VerifyCodeState.success(accessToken: $accessToken, permission: $permission, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $VerifyCodeStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken, List<String> permission, Map<String, dynamic> data});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of VerifyCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? permission = null,
    Object? data = null,
  }) {
    return _then(_Success(
      null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      null == permission
          ? _self._permission
          : permission // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _Error implements VerifyCodeState {
  const _Error(this.error);

  final String error;

  /// Create a copy of VerifyCodeState
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
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'VerifyCodeState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $VerifyCodeStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of VerifyCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VerifyCodeEvent {
  String get authId;
  String get code;
  OnLoginSuccess get onSuccess;
  String? get urlAuthApiTwoFactor;

  /// Create a copy of VerifyCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyCodeEventCopyWith<VerifyCodeEvent> get copyWith =>
      _$VerifyCodeEventCopyWithImpl<VerifyCodeEvent>(
          this as VerifyCodeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyCodeEvent &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.urlAuthApiTwoFactor, urlAuthApiTwoFactor) ||
                other.urlAuthApiTwoFactor == urlAuthApiTwoFactor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authId, code, onSuccess, urlAuthApiTwoFactor);

  @override
  String toString() {
    return 'VerifyCodeEvent(authId: $authId, code: $code, onSuccess: $onSuccess, urlAuthApiTwoFactor: $urlAuthApiTwoFactor)';
  }
}

/// @nodoc
abstract mixin class $VerifyCodeEventCopyWith<$Res> {
  factory $VerifyCodeEventCopyWith(
          VerifyCodeEvent value, $Res Function(VerifyCodeEvent) _then) =
      _$VerifyCodeEventCopyWithImpl;
  @useResult
  $Res call(
      {String authId,
      String code,
      OnLoginSuccess onSuccess,
      String? urlAuthApiTwoFactor});
}

/// @nodoc
class _$VerifyCodeEventCopyWithImpl<$Res>
    implements $VerifyCodeEventCopyWith<$Res> {
  _$VerifyCodeEventCopyWithImpl(this._self, this._then);

  final VerifyCodeEvent _self;
  final $Res Function(VerifyCodeEvent) _then;

  /// Create a copy of VerifyCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authId = null,
    Object? code = null,
    Object? onSuccess = null,
    Object? urlAuthApiTwoFactor = freezed,
  }) {
    return _then(_self.copyWith(
      authId: null == authId
          ? _self.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _self.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as OnLoginSuccess,
      urlAuthApiTwoFactor: freezed == urlAuthApiTwoFactor
          ? _self.urlAuthApiTwoFactor
          : urlAuthApiTwoFactor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VerifyCodeEvent].
extension VerifyCodeEventPatterns on VerifyCodeEvent {
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
    TResult Function(String authId, String code, OnLoginSuccess onSuccess,
            String? urlAuthApiTwoFactor)?
        submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that.authId, _that.code, _that.onSuccess,
            _that.urlAuthApiTwoFactor);
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
    required TResult Function(String authId, String code,
            OnLoginSuccess onSuccess, String? urlAuthApiTwoFactor)
        submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit():
        return submit(_that.authId, _that.code, _that.onSuccess,
            _that.urlAuthApiTwoFactor);
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
    TResult? Function(String authId, String code, OnLoginSuccess onSuccess,
            String? urlAuthApiTwoFactor)?
        submit,
  }) {
    final _that = this;
    switch (_that) {
      case _Submit() when submit != null:
        return submit(_that.authId, _that.code, _that.onSuccess,
            _that.urlAuthApiTwoFactor);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Submit implements VerifyCodeEvent {
  const _Submit(
      this.authId, this.code, this.onSuccess, this.urlAuthApiTwoFactor);

  @override
  final String authId;
  @override
  final String code;
  @override
  final OnLoginSuccess onSuccess;
  @override
  final String? urlAuthApiTwoFactor;

  /// Create a copy of VerifyCodeEvent
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
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.urlAuthApiTwoFactor, urlAuthApiTwoFactor) ||
                other.urlAuthApiTwoFactor == urlAuthApiTwoFactor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authId, code, onSuccess, urlAuthApiTwoFactor);

  @override
  String toString() {
    return 'VerifyCodeEvent.submit(authId: $authId, code: $code, onSuccess: $onSuccess, urlAuthApiTwoFactor: $urlAuthApiTwoFactor)';
  }
}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res>
    implements $VerifyCodeEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) =
      __$SubmitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String authId,
      String code,
      OnLoginSuccess onSuccess,
      String? urlAuthApiTwoFactor});
}

/// @nodoc
class __$SubmitCopyWithImpl<$Res> implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

  /// Create a copy of VerifyCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authId = null,
    Object? code = null,
    Object? onSuccess = null,
    Object? urlAuthApiTwoFactor = freezed,
  }) {
    return _then(_Submit(
      null == authId
          ? _self.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == onSuccess
          ? _self.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as OnLoginSuccess,
      freezed == urlAuthApiTwoFactor
          ? _self.urlAuthApiTwoFactor
          : urlAuthApiTwoFactor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
