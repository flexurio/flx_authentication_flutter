import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_employee_query_bloc.freezed.dart';

@freezed
class RoleEmployeeQueryState with _$RoleEmployeeQueryState {
  const factory RoleEmployeeQueryState.initial() = _Initial;
  const factory RoleEmployeeQueryState.loading() = _Loading;
  const factory RoleEmployeeQueryState.loaded(List<String> roleEmployees) =
      _Success;
  const factory RoleEmployeeQueryState.error(String error) = _Error;
}

@freezed
class RoleEmployeeQueryEvent with _$RoleEmployeeQueryEvent {
  const factory RoleEmployeeQueryEvent.fetch() = _Fetch;
}

class RoleEmployeeQueryBloc
    extends Bloc<RoleEmployeeQueryEvent, RoleEmployeeQueryState> {
  RoleEmployeeQueryBloc({required this.role, required this.accessToken})
      : super(const _Initial()) {
    on<RoleEmployeeQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final roleEmployee = await AuthenticationRepositoryApi.instance
                .roleEmployeeFetch(accessToken: accessToken, role: role);
            emit(_Success(roleEmployee));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final String accessToken;
  final Role role;
}
