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

@widgetbook.UseCase(
  name: 'With Asset Logo',
  type: LoginPage,
)
Widget loginPageWithAssetLogoUseCase(BuildContext context) {
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
    logoUrl: 'assets/images/logoipsum.png',
    logoNamedUrl: 'assets/images/logoipsum-named.png',
  );
}

@widgetbook.UseCase(
  name: 'Mock flx-nocode-api (POST)',
  type: LoginPage,
)
Widget loginPageMockNoCodeApiUseCase(BuildContext context) {
  final withTwoFactor = context.knobs.boolean(
    label: 'With Two Factor',
    initialValue: false,
  );
  return LoginPage.prepare(
    urlAuthApi: withTwoFactor
        ? 'http://mock.local/users/login'
        : 'http://mock.local/login',
    withTwoFactor: withTwoFactor,
    usernameLabel: context.knobs.string(
      label: 'Username Label',
      initialValue: 'NIP',
    ),
    usingPassword: true,
    loginType: LoginFormType.nipPassword,
    onLoginSuccess: (token, payload) async {
      debugPrint('[WIDGETBOOK MOCK] Login success! payload=$payload');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Login Sukses! NIP: ${payload['nip']} | Role: ${payload['rl']}',
            ),
          ),
        );
      }
      return payload;
    },
  );
}
