import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_authentication_flutter/src/app/util/jwt.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_bloc.freezed.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState.initial() = _Initial;
  const factory VerifyCodeState.loading() = _Loading;
  const factory VerifyCodeState.success(
    String accessToken,
    List<String> permission,
    Map<String, dynamic> data,
  ) = _Success;
  const factory VerifyCodeState.error(String error) = _Error;
}

@freezed
class VerifyCodeEvent with _$VerifyCodeEvent {
  const factory VerifyCodeEvent.submit(
    String authId,
    String code,
    OnLoginSuccess onSuccess,
    String? urlAuthApiTwoFactor,
  ) = _Submit;
}

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  VerifyCodeBloc() : super(const _Initial()) {
    on<VerifyCodeEvent>((event, emit) async {
      await event.when(
        submit: (authId, code, onSuccess, urlAuthApiTwoFactor) async {
          emit(const _Loading());
          try {
            // final accessToken =
            //     await AuthenticationRepositoryApi.instance.verifyCode(
            //   authId: authId,
            //   code: code,
            //   urlAuthApiTwoFactor: urlAuthApiTwoFactor,
            // );

            final accessToken =
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6IjVhMmRjODlkLTUwN2QtNGI4OS1hODBlLTQzN2Q3MzQzOWQ3ZSIsImF1dGhvcml6ZWQiOnRydWUsImNvbXBhbnlfaWQiOjEsImNvbXBhbnlfbmFtZSI6IlJJU01BV0FOIFBSQVRBTUEgQkVSU0lOQVIiLCJleHAiOjE3NjcwNzY4NTUsImlkIjoiVkxUTi02Mjg3NzM1MjE5OTUyIiwibmFtZSI6Ill1c3VmIERhcm1hamkiLCJwYWNrYWdlIjoiZW50ZXJwcmlzZSIsInJvbGUiOiJlbXBsb3llZSIsInN0YXR1cyI6IlByZW1pdW0iLCJ1bml0X2lkIjoiVkxUTiIsInVuaXRfaWRzIjpudWxsLCJ1c2VyX2lkIjoyMzF9.tVmMfB5Y3A36App6eBZ_zYTuj73dLhpxAevKhCzzWAI";

            final user = extractPayloadFromJwt(accessToken);
            final data = await onSuccess(accessToken, user);

            final roles =
                await AuthenticationRepositoryApi.instance.employeeRoleFetch(
              accessToken: accessToken,
              employeeId: user['id'].toString(),
            );

            final permissions = <String>[];
            for (final role in roles) {
              final rolePermissions = await AuthenticationRepositoryApi.instance
                  .rolePermissionFetch(
                accessToken: accessToken,
                role: role,
              );
              for (final rolePermission in rolePermissions) {
                if (!permissions.contains(rolePermission)) {
                  permissions.add(rolePermission);
                }
              }
            }

            emit(_Success(accessToken, permissions, data));
          } on ApiException catch (error, st) {
            print('ApiException caught in verifyCode: $error\n$st');
            emit(_Error(error.message));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
