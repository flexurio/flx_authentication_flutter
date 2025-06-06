import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_authentication_flutter/src/app/util/access.dart';
import 'package:flx_authentication_flutter/src/app/util/jwt.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(
    String token,
    List<String> permission,
    Map<String, dynamic> data,
  ) = _Success;
  const factory LoginState.successWithTwoFactor(String authId) =
      _SuccessWithTwoFactor;
  const factory LoginState.error({
    String? nip,
    String? password,
    String? other,
  }) = _Error;
}

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.submit(
    String nip,
    String password,
    bool withTwoFactor,
    String? urlApi,
  ) = _Submit;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        submit: (nip, password, withTwoFactor, urlApi) async {
          emit(const _Loading());
          try {
            final repository = AuthenticationRepositoryApi.instance;
            if (withTwoFactor) {
              final authId = await repository.loginWithTwoFactor(
                nip: nip,
                password: password,
              );
              emit(_SuccessWithTwoFactor(authId));
            } else {
              final token = await repository.login(
                nip: nip,
                password: password,
                url: urlApi ?? '',
              );
              final data = extractPayloadFromJwt(token);
              final permission = Access.fetchPermissions(data['rl'] as String);
              emit(_Success(token, permission, data));
            }
          } on ApiException catch (error) {
            emit(_Error(nip: error.message));
          } catch (error) {
            emit(const _Error(other: errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
