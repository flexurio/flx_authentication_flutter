// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportAccessImpl _$$ReportAccessImplFromJson(Map<String, dynamic> json) =>
    _$ReportAccessImpl(
      departmentName: json['department_name'] as String,
      userName: json['user_name'] as String,
      nip: json['nip'] as String,
      menu: json['menu'] as String,
    );

Map<String, dynamic> _$$ReportAccessImplToJson(_$ReportAccessImpl instance) =>
    <String, dynamic>{
      'department_name': instance.departmentName,
      'user_name': instance.userName,
      'nip': instance.nip,
      'menu': instance.menu,
    };
