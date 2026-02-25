import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';

class LoginVerificationView extends StatelessWidget {
  const LoginVerificationView({
    required this.contentPadding,
    required this.urlAuthApiTwoFactor,
    required this.pinLength,
    required this.authId,
    required this.onBackPressed,
    required this.onLoginSuccess,
    super.key,
  });

  final EdgeInsets contentPadding;
  final String? urlAuthApiTwoFactor;
  final int pinLength;
  final String authId;
  final VoidCallback onBackPressed;
  final OnLoginSuccess onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: VerifyCodeForm.prepare(
        urlAuthApiTwoFactor: urlAuthApiTwoFactor,
        pinLength: pinLength,
        authId: authId,
        onBackPressed: onBackPressed,
        onLoginSuccess: onLoginSuccess,
      ),
    );
  }
}
