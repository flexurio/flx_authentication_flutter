import 'package:flx_authentication_flutter/src/app/model/report_access.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_user_access_query_bloc.freezed.dart';

@freezed
class ReportUserAccessQueryState with _$ReportUserAccessQueryState {
  const factory ReportUserAccessQueryState.initial() = _Initial;
  const factory ReportUserAccessQueryState.loading() = _Loading;
  const factory ReportUserAccessQueryState.loaded(
    List<ReportAccess> roleEmployees,
  ) = _Success;
  const factory ReportUserAccessQueryState.error(String error) = _Error;
}

@freezed
class ReportUserAccessQueryEvent with _$ReportUserAccessQueryEvent {
  const factory ReportUserAccessQueryEvent.fetch({
    String? departmentName,
    String? employeeId,
  }) = _Fetch;
}

class ReportUserAccessQueryBloc
    extends Bloc<ReportUserAccessQueryEvent, ReportUserAccessQueryState> {
  ReportUserAccessQueryBloc({required this.accessToken})
      : super(const _Initial()) {
    on<ReportUserAccessQueryEvent>((event, emit) async {
      await event.when(
        fetch: (departmentName, employeeId) async {
          emit(const _Loading());
          try {
            final reportAccess =
                await AuthenticationRepositoryApi.instance.reportAccessFetch(
              accessToken: accessToken,
              departmentName: departmentName,
              employeeId: employeeId,
            );
            emit(_Success(reportAccess));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final String accessToken;
}
