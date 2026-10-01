// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportAccess _$ReportAccessFromJson(Map<String, dynamic> json) =>
    _ReportAccess(
      departmentName: json['department_name'] as String,
      userName: json['user_name'] as String,
      nip: json['nip'] as String,
      menu: json['menu'] as String,
    );

Map<String, dynamic> _$ReportAccessToJson(_ReportAccess instance) =>
    <String, dynamic>{
      'department_name': instance.departmentName,
      'user_name': instance.userName,
      'nip': instance.nip,
      'menu': instance.menu,
    };
