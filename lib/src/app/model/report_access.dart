import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_access.freezed.dart';
part 'report_access.g.dart';

@freezed
class ReportAccess with _$ReportAccess {
  factory ReportAccess({
    @JsonKey(name: 'department_name') required String departmentName,
    @JsonKey(name: 'user_name') required String userName,
    required String nip,
    required String menu,
  }) = _ReportAccess;
  const ReportAccess._();

  factory ReportAccess.fromJson(Map<String, dynamic> json) =>
      _$ReportAccessFromJson(json);

  factory ReportAccess.empty() {
    return ReportAccess(
      departmentName: '',
      userName: '',
      nip: '',
      menu: '',
    );
  }
}
