import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._(
    this.onLoginSuccess,
    this.withTwoFactor,
    this.logoUrl,
    this.urlAuthApiTwoFactor,
    this.logoNamedUrl,
    this.urlAuthApi,
    this.usingPassword,
    this.usernameLabel,
    this.pinLength,
    this.loginType,
  );

  final OnLoginSuccess onLoginSuccess;
  final bool withTwoFactor;
  final String? logoUrl;
  final bool usingPassword;
  final String usernameLabel;
  final String? logoNamedUrl;
  final String? urlAuthApi;
  final String? urlAuthApiTwoFactor;
  final int pinLength;
  final LoginFormType loginType;

  static Widget prepare({
    required OnLoginSuccess onLoginSuccess,
    required bool withTwoFactor,
    String? logoUrl,
    String? logoNamedUrl,
    String? urlAuthApiTwoFactor,
    String? urlAuthApi,
    bool usingPassword = true,
    String usernameLabel = 'NIP',
    int pinLength = 6,
    LoginFormType loginType = LoginFormType.nipPassword,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: LoginPage._(
        onLoginSuccess,
        withTwoFactor,
        logoUrl,
        urlAuthApiTwoFactor,
        logoNamedUrl,
        urlAuthApi,
        usingPassword,
        usernameLabel,
        pinLength,
        loginType,
      ),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageController = PageController();
  var _authId = '';

  void _switchPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginContainer(
      logoUrl: widget.logoUrl,
      logoNamedUrl: widget.logoNamedUrl,
      builder: (contentPadding) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            LoginCredentialView(
              contentPadding: contentPadding,
              loginType: widget.loginType,
              usingPassword: widget.usingPassword,
              usernameLabel: widget.usernameLabel,
              urlAuthApi: widget.urlAuthApi,
              withTwoFactor: widget.withTwoFactor,
              onSuccessWithTwoFactor: (authId) {
                setState(() => _authId = authId);
                _switchPage(1);
              },
              onLoginSuccess: widget.onLoginSuccess,
            ),
            LoginVerificationView(
              contentPadding: contentPadding,
              urlAuthApiTwoFactor: widget.urlAuthApiTwoFactor,
              pinLength: widget.pinLength,
              authId: _authId,
              onBackPressed: () => _switchPage(0),
              onLoginSuccess: widget.onLoginSuccess,
            ),
          ],
        );
      },
    );
  }
}
