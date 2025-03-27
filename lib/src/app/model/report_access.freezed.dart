// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_access.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportAccess _$ReportAccessFromJson(Map<String, dynamic> json) {
  return _ReportAccess.fromJson(json);
}

/// @nodoc
mixin _$ReportAccess {
  @JsonKey(name: 'department_name')
  String get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  String get nip => throw _privateConstructorUsedError;
  String get menu => throw _privateConstructorUsedError;

  /// Serializes this ReportAccess to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportAccessCopyWith<ReportAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportAccessCopyWith<$Res> {
  factory $ReportAccessCopyWith(
          ReportAccess value, $Res Function(ReportAccess) then) =
      _$ReportAccessCopyWithImpl<$Res, ReportAccess>;
  @useResult
  $Res call(
      {@JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'user_name') String userName,
      String nip,
      String menu});
}

/// @nodoc
class _$ReportAccessCopyWithImpl<$Res, $Val extends ReportAccess>
    implements $ReportAccessCopyWith<$Res> {
  _$ReportAccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      nip: null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportAccessImplCopyWith<$Res>
    implements $ReportAccessCopyWith<$Res> {
  factory _$$ReportAccessImplCopyWith(
          _$ReportAccessImpl value, $Res Function(_$ReportAccessImpl) then) =
      __$$ReportAccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'user_name') String userName,
      String nip,
      String menu});
}

/// @nodoc
class __$$ReportAccessImplCopyWithImpl<$Res>
    extends _$ReportAccessCopyWithImpl<$Res, _$ReportAccessImpl>
    implements _$$ReportAccessImplCopyWith<$Res> {
  __$$ReportAccessImplCopyWithImpl(
      _$ReportAccessImpl _value, $Res Function(_$ReportAccessImpl) _then)
      : super(_value, _then);

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
    return _then(_$ReportAccessImpl(
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      nip: null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportAccessImpl extends _ReportAccess {
  _$ReportAccessImpl(
      {@JsonKey(name: 'department_name') required this.departmentName,
      @JsonKey(name: 'user_name') required this.userName,
      required this.nip,
      required this.menu})
      : super._();

  factory _$ReportAccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportAccessImplFromJson(json);

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

  @override
  String toString() {
    return 'ReportAccess(departmentName: $departmentName, userName: $userName, nip: $nip, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportAccessImpl &&
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

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportAccessImplCopyWith<_$ReportAccessImpl> get copyWith =>
      __$$ReportAccessImplCopyWithImpl<_$ReportAccessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportAccessImplToJson(
      this,
    );
  }
}

abstract class _ReportAccess extends ReportAccess {
  factory _ReportAccess(
      {@JsonKey(name: 'department_name') required final String departmentName,
      @JsonKey(name: 'user_name') required final String userName,
      required final String nip,
      required final String menu}) = _$ReportAccessImpl;
  _ReportAccess._() : super._();

  factory _ReportAccess.fromJson(Map<String, dynamic> json) =
      _$ReportAccessImpl.fromJson;

  @override
  @JsonKey(name: 'department_name')
  String get departmentName;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  String get nip;
  @override
  String get menu;

  /// Create a copy of ReportAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportAccessImplCopyWith<_$ReportAccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
