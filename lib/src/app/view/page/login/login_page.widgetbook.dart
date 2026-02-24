import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: LoginPage,
)
Widget loginPageDefaultUseCase(BuildContext context) {
  return LoginPage.prepare(
    onLoginSuccess: (token, payload) async {
      debugPrint('Login success: $token');
      return {};
    },
    withTwoFactor: context.knobs.boolean(
      label: 'With Two Factor',
    ),
    usernameLabel: context.knobs.string(
      label: 'Username Label',
      initialValue: 'NIP',
    ),
    usingPassword: context.knobs.boolean(
      label: 'Using Password',
      initialValue: true,
    ),
    loginType: context.knobs.list<LoginFormType>(
      label: 'Login Type',
      options: LoginFormType.values,
      initialOption: LoginFormType.nipPassword,
    ),
  );
}
