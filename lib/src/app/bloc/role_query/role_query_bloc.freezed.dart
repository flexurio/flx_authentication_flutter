// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleQueryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoleQueryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RoleQueryState()';
  }
}

/// @nodoc
class $RoleQueryStateCopyWith<$Res> {
  $RoleQueryStateCopyWith(RoleQueryState _, $Res Function(RoleQueryState) __);
}

/// Adds pattern-matching-related methods to [RoleQueryState].
extension RoleQueryStatePatterns on RoleQueryState {
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
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when loaded != null:
        return loaded(_that);
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Success():
        return loaded(_that);
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
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when loaded != null:
        return loaded(_that);
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
    TResult Function(PageOptions<Role> pageOptions)? loading,
    TResult Function(PageOptions<Role> pageOptions)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.pageOptions);
      case _Success() when loaded != null:
        return loaded(_that.pageOptions);
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
    required TResult Function(PageOptions<Role> pageOptions) loading,
    required TResult Function(PageOptions<Role> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading(_that.pageOptions);
      case _Success():
        return loaded(_that.pageOptions);
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
    TResult? Function(PageOptions<Role> pageOptions)? loading,
    TResult? Function(PageOptions<Role> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.pageOptions);
      case _Success() when loaded != null:
        return loaded(_that.pageOptions);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements RoleQueryState {
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
    return 'RoleQueryState.initial()';
  }
}

/// @nodoc

class _Loading implements RoleQueryState {
  const _Loading(this.pageOptions);

  final PageOptions<Role> pageOptions;

  /// Create a copy of RoleQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'RoleQueryState.loading(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $RoleQueryStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @useResult
  $Res call({PageOptions<Role> pageOptions});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of RoleQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_Loading(
      null == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Role>,
    ));
  }
}

/// @nodoc

class _Success implements RoleQueryState {
  const _Success(this.pageOptions);

  final PageOptions<Role> pageOptions;

  /// Create a copy of RoleQueryState
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
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'RoleQueryState.loaded(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $RoleQueryStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({PageOptions<Role> pageOptions});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of RoleQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_Success(
      null == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Role>,
    ));
  }
}

/// @nodoc

class _Error implements RoleQueryState {
  const _Error(this.error);

  final String error;

  /// Create a copy of RoleQueryState
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
    return 'RoleQueryState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $RoleQueryStateCopyWith<$Res> {
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

  /// Create a copy of RoleQueryState
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
mixin _$RoleQueryEvent {
  PageOptions<Role>? get pageOptions;

  /// Create a copy of RoleQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleQueryEventCopyWith<RoleQueryEvent> get copyWith =>
      _$RoleQueryEventCopyWithImpl<RoleQueryEvent>(
          this as RoleQueryEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoleQueryEvent &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'RoleQueryEvent(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class $RoleQueryEventCopyWith<$Res> {
  factory $RoleQueryEventCopyWith(
          RoleQueryEvent value, $Res Function(RoleQueryEvent) _then) =
      _$RoleQueryEventCopyWithImpl;
  @useResult
  $Res call({PageOptions<Role>? pageOptions});
}

/// @nodoc
class _$RoleQueryEventCopyWithImpl<$Res>
    implements $RoleQueryEventCopyWith<$Res> {
  _$RoleQueryEventCopyWithImpl(this._self, this._then);

  final RoleQueryEvent _self;
  final $Res Function(RoleQueryEvent) _then;

  /// Create a copy of RoleQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
  }) {
    return _then(_self.copyWith(
      pageOptions: freezed == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Role>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RoleQueryEvent].
extension RoleQueryEventPatterns on RoleQueryEvent {
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
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
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
    required TResult Function(_Fetch value) fetch,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that);
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
    TResult? Function(_Fetch value)? fetch,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
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
    TResult Function(PageOptions<Role>? pageOptions)? fetch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that.pageOptions);
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
    required TResult Function(PageOptions<Role>? pageOptions) fetch,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that.pageOptions);
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
    TResult? Function(PageOptions<Role>? pageOptions)? fetch,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that.pageOptions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Fetch implements RoleQueryEvent {
  const _Fetch({this.pageOptions});

  @override
  final PageOptions<Role>? pageOptions;

  /// Create a copy of RoleQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'RoleQueryEvent.fetch(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $RoleQueryEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @override
  @useResult
  $Res call({PageOptions<Role>? pageOptions});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of RoleQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = freezed,
  }) {
    return _then(_Fetch(
      pageOptions: freezed == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Role>?,
    ));
  }
}

// dart format on
