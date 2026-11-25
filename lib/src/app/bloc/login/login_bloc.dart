import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_authentication_flutter/src/app/util/access.dart';
import 'package:flx_authentication_flutter/src/app/util/jwt.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';
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
    Map<String, dynamic> data, {
    String? refreshToken,
  }) = _Success;
  const factory LoginState.successWithTwoFactor(String authId) =
      _SuccessWithTwoFactor;
  const factory LoginState.error({
    String? nip,
    String? password,
    String? other,
  }) = _Error;
}

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.submit(
    String nip,
    String password,
    bool withTwoFactor,
    String? urlApi, {
    OnLoginSuccess? onLoginSuccess,
  }) = _Submit;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({AuthenticationRepositoryApi? repository})
      : _repository = repository ?? AuthenticationRepositoryApi.instance,
        super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        submit: (nip, password, withTwoFactor, urlApi, onLoginSuccess) async {
          emit(const _Loading());
          try {
            print(
              '[LOGIN] submit with nip: $nip, withTwoFactor: $withTwoFactor',
            );
            final result = await _repository.loginWithTwoFactor(
              nip: nip,
              password: password,
              url: urlApi,
              method: withTwoFactor ? null : 'POST',
            );
            if (withTwoFactor && result.isTwoFactor) {
              emit(_SuccessWithTwoFactor(result.authId!));
            } else {
              final accessToken = result.accessToken;
              if (accessToken == null || accessToken.isEmpty) {
                throw ApiException.fromType(ExceptionType.invalidCredentials);
              }

              final user = extractPayloadFromJwt(accessToken);
              final data = onLoginSuccess != null
                  ? await onLoginSuccess(accessToken, user)
                  : <String, dynamic>{};

              final host = _extractOrigin(urlApi);
              final employeeId =
                  (user['id'] ?? user['user_id'] ?? user['nip'])
                          ?.toString() ??
                      '';

              final permissions = await _repository.fetchUserPermissions(
                accessToken: accessToken,
                employeeId: employeeId,
                host: host,
              );

              emit(
                _Success(
                  accessToken,
                  permissions,
                  data,
                  refreshToken: result.refreshToken,
                ),
              );
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

  final AuthenticationRepositoryApi _repository;

  static String? _extractOrigin(String? urlApi) {
    if (urlApi == null || urlApi.isEmpty) return null;
    final uri = Uri.tryParse(urlApi);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    return uri.hasPort
        ? '${uri.scheme}://${uri.host}:${uri.port}'
        : '${uri.scheme}://${uri.host}';
  }
}
