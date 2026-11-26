import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';

class LoginCredentialView extends StatelessWidget {
  const LoginCredentialView({
    required this.contentPadding,
    required this.loginType,
    required this.usingPassword,
    required this.usernameLabel,
    required this.urlAuthApi,
    required this.withTwoFactor,
    required this.onSuccessWithTwoFactor,
    required this.onLoginSuccess,
    this.config,
    this.additionalField,
    this.onUsernameChanged,
    this.authMethod,
    super.key,
  });

  final EdgeInsets contentPadding;
  final LoginFormType loginType;
  final bool usingPassword;
  final String usernameLabel;
  final String? urlAuthApi;
  final bool withTwoFactor;
  final void Function(String authId) onSuccessWithTwoFactor;
  final OnLoginSuccess onLoginSuccess;
  final LoginConfig? config;
  final Widget? additionalField;
  final ValueChanged<String>? onUsernameChanged;
  final String? authMethod;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: contentPadding,
      duration: const Duration(milliseconds: 350),
      child: LoginForm(
        loginType: loginType,
        usingPassword: usingPassword,
        usernameLabel: usernameLabel,
        urlAuthApi: urlAuthApi,
        withTwoFactor: withTwoFactor,
        authMethod: authMethod,
        onSuccessWithTwoFactor: onSuccessWithTwoFactor,
        onLoginSuccess: onLoginSuccess,
        config: config,
        additionalField: additionalField,
        onUsernameChanged: onUsernameChanged,
        onSuccess: (accessToken, permissions, data, {refreshToken}) {
          AuthenticationBloc.instance.add(
            AuthenticationEvent.login(
              accessToken,
              permissions,
              data,
              refreshToken: refreshToken,
            ),
          );
        },
      ),
    );
  }
}
