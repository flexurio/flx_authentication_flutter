// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthenticationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenticationState()';
  }
}

/// @nodoc
class $AuthenticationStateCopyWith<$Res> {
  $AuthenticationStateCopyWith(
      AuthenticationState _, $Res Function(AuthenticationState) __);
}

/// Adds pattern-matching-related methods to [AuthenticationState].
extension AuthenticationStatePatterns on AuthenticationState {
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
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
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
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated():
        return unauthenticated(_that);
      case _Authenticated():
        return authenticated(_that);
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
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
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
    TResult Function()? unauthenticated,
    TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        authenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
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
    required TResult Function() unauthenticated,
    required TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)
        authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated():
        return unauthenticated();
      case _Authenticated():
        return authenticated(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
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
    TResult? Function()? unauthenticated,
    TResult? Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        authenticated,
  }) {
    final _that = this;
    switch (_that) {
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Unauthenticated implements AuthenticationState {
  const _Unauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }
}

/// @nodoc

class _Authenticated implements AuthenticationState {
  const _Authenticated(this.accessToken, final List<String> permission,
      final Map<String, dynamic> data,
      {this.refreshToken})
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

  final String? refreshToken;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      const DeepCollectionEquality().hash(_permission),
      const DeepCollectionEquality().hash(_data),
      refreshToken);

  @override
  String toString() {
    return 'AuthenticationState.authenticated(accessToken: $accessToken, permission: $permission, data: $data, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) _then) =
      __$AuthenticatedCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      List<String> permission,
      Map<String, dynamic> data,
      String? refreshToken});
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? permission = null,
    Object? data = null,
    Object? refreshToken = freezed,
  }) {
    return _then(_Authenticated(
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
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AuthenticationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthenticationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenticationEvent()';
  }
}

/// @nodoc
class $AuthenticationEventCopyWith<$Res> {
  $AuthenticationEventCopyWith(
      AuthenticationEvent _, $Res Function(AuthenticationEvent) __);
}

/// Adds pattern-matching-related methods to [AuthenticationEvent].
extension AuthenticationEventPatterns on AuthenticationEvent {
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
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Login() when login != null:
        return login(_that);
      case _Logout() when logout != null:
        return logout(_that);
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
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
  }) {
    final _that = this;
    switch (_that) {
      case _Login():
        return login(_that);
      case _Logout():
        return logout(_that);
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
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
  }) {
    final _that = this;
    switch (_that) {
      case _Login() when login != null:
        return login(_that);
      case _Logout() when logout != null:
        return logout(_that);
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
    TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        login,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Login() when login != null:
        return login(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
      case _Logout() when logout != null:
        return logout();
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
    required TResult Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)
        login,
    required TResult Function() logout,
  }) {
    final _that = this;
    switch (_that) {
      case _Login():
        return login(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
      case _Logout():
        return logout();
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
    TResult? Function(String accessToken, List<String> permission,
            Map<String, dynamic> data, String? refreshToken)?
        login,
    TResult? Function()? logout,
  }) {
    final _that = this;
    switch (_that) {
      case _Login() when login != null:
        return login(_that.accessToken, _that.permission, _that.data,
            _that.refreshToken);
      case _Logout() when logout != null:
        return logout();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Login implements AuthenticationEvent {
  const _Login(this.accessToken, final List<String> permission,
      final Map<String, dynamic> data,
      {this.refreshToken})
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

  final String? refreshToken;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Login &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      const DeepCollectionEquality().hash(_permission),
      const DeepCollectionEquality().hash(_data),
      refreshToken);

  @override
  String toString() {
    return 'AuthenticationEvent.login(accessToken: $accessToken, permission: $permission, data: $data, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) =
      __$LoginCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      List<String> permission,
      Map<String, dynamic> data,
      String? refreshToken});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? permission = null,
    Object? data = null,
    Object? refreshToken = freezed,
  }) {
    return _then(_Login(
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
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Logout implements AuthenticationEvent {
  const _Logout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenticationEvent.logout()';
  }
}

// dart format on
