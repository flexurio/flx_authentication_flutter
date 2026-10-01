// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_access.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportAccess {
  @JsonKey(name: 'department_name')
  String get departmentName;
  @JsonKey(name: 'user_name')
  String get userName;
  String get nip;
  String get menu;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportAccessCopyWith<ReportAccess> get copyWith =>
      _$ReportAccessCopyWithImpl<ReportAccess>(
          this as ReportAccess, _$identity);

  /// Serializes this ReportAccess to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportAccess &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, departmentName, userName, nip, menu);

  @override
  String toString() {
    return 'ReportAccess(departmentName: $departmentName, userName: $userName, nip: $nip, menu: $menu)';
  }
}

/// @nodoc
abstract mixin class $ReportAccessCopyWith<$Res> {
  factory $ReportAccessCopyWith(
          ReportAccess value, $Res Function(ReportAccess) _then) =
      _$ReportAccessCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'user_name') String userName,
      String nip,
      String menu});
}

/// @nodoc
class _$ReportAccessCopyWithImpl<$Res> implements $ReportAccessCopyWith<$Res> {
  _$ReportAccessCopyWithImpl(this._self, this._then);

  final ReportAccess _self;
  final $Res Function(ReportAccess) _then;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentName = null,
    Object? userName = null,
    Object? nip = null,
    Object? menu = null,
  }) {
    return _then(_self.copyWith(
      departmentName: null == departmentName
          ? _self.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _self.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportAccess].
extension ReportAccessPatterns on ReportAccess {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReportAccess value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportAccess() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_ReportAccess value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAccess():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReportAccess value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAccess() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'department_name') String departmentName,
            @JsonKey(name: 'user_name') String userName,
            String nip,
            String menu)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportAccess() when $default != null:
        return $default(
            _that.departmentName, _that.userName, _that.nip, _that.menu);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'department_name') String departmentName,
            @JsonKey(name: 'user_name') String userName,
            String nip,
            String menu)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAccess():
        return $default(
            _that.departmentName, _that.userName, _that.nip, _that.menu);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'department_name') String departmentName,
            @JsonKey(name: 'user_name') String userName,
            String nip,
            String menu)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportAccess() when $default != null:
        return $default(
            _that.departmentName, _that.userName, _that.nip, _that.menu);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportAccess extends ReportAccess {
  _ReportAccess(
      {@JsonKey(name: 'department_name') required this.departmentName,
      @JsonKey(name: 'user_name') required this.userName,
      required this.nip,
      required this.menu})
      : super._();
  factory _ReportAccess.fromJson(Map<String, dynamic> json) =>
      _$ReportAccessFromJson(json);

  @override
  @JsonKey(name: 'department_name')
  final String departmentName;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  final String nip;
  @override
  final String menu;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportAccessCopyWith<_ReportAccess> get copyWith =>
      __$ReportAccessCopyWithImpl<_ReportAccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportAccessToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportAccess &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, departmentName, userName, nip, menu);

  @override
  String toString() {
    return 'ReportAccess(departmentName: $departmentName, userName: $userName, nip: $nip, menu: $menu)';
  }
}

/// @nodoc
abstract mixin class _$ReportAccessCopyWith<$Res>
    implements $ReportAccessCopyWith<$Res> {
  factory _$ReportAccessCopyWith(
          _ReportAccess value, $Res Function(_ReportAccess) _then) =
      __$ReportAccessCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'user_name') String userName,
      String nip,
      String menu});
}

/// @nodoc
class __$ReportAccessCopyWithImpl<$Res>
    implements _$ReportAccessCopyWith<$Res> {
  __$ReportAccessCopyWithImpl(this._self, this._then);

  final _ReportAccess _self;
  final $Res Function(_ReportAccess) _then;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? departmentName = null,
    Object? userName = null,
    Object? nip = null,
    Object? menu = null,
  }) {
    return _then(_ReportAccess(
      departmentName: null == departmentName
          ? _self.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      nip: null == nip
          ? _self.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _self.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
