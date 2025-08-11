import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';
import 'package:flx_authentication_flutter/src/app/view/page/login/widget/auth_card_form.dart';
import 'package:flx_authentication_flutter/src/app/view/page/login/widget/sign_up_form.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:screen_identifier/screen_identifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._(
    this.onLoginSuccess,
    this.withTwoFactor,
    this.logoUrl,
    this.logoNamedUrl,
    this.urlAuthApi,
    this.signUpPage,
  );

  final OnLoginSuccess onLoginSuccess;
  final bool withTwoFactor;
  final String? logoUrl;
  final String? logoNamedUrl;
  final String? urlAuthApi;
  final Widget Function({required VoidCallback onSuccess}) signUpPage;

  static Widget prepare({
    required OnLoginSuccess onLoginSuccess,
    required bool withTwoFactor,
    String? logoUrl,
    String? logoNamedUrl,
    String? urlAuthApi,
    required Widget Function({required VoidCallback onSuccess}) signUpPage,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: LoginPage._(
        onLoginSuccess,
        withTwoFactor,
        logoUrl,
        logoNamedUrl,
        urlAuthApi,
        signUpPage,
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
    return _Container(
      logoUrl: widget.logoUrl,
      logoNamedUrl: widget.logoNamedUrl,
      builder: (contentPadding) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            AuthCardForm(
              title: 'Welcome Back!',
              subtitle: 'Sign in to continue',
              child: _buildSignIn(),
            ),
            AuthCardForm(
              title: 'Create Account',
              subtitle: 'Join us today',
              child: _buildSignUp(),
            ),
            _buildFormVerification(contentPadding),
          ],
        );
      },
    );
  }

  Padding _buildFormVerification(EdgeInsets contentPadding) {
    return Padding(
      padding: contentPadding,
      child: VerifyCodeForm.prepare(
        authId: _authId,
        onBackPressed: () => _switchPage(0),
        onLoginSuccess: widget.onLoginSuccess,
      ),
    );
  }

  Widget _buildSignIn() {
    return LoginForm(
      urlAuthApi: widget.urlAuthApi,
      withTwoFactor: widget.withTwoFactor,
      onTapSignUp: () => _switchPage(1),
      onSuccessWithTwoFactor: (authId) {
        setState(() => _authId = authId);
        _switchPage(1);
      },
      onSuccess: (accessToken, permissions, data) {
        AuthenticationBloc.instance.add(
          AuthenticationEvent.login(accessToken, permissions, data),
        );
        widget.onLoginSuccess(
          accessToken,
          extractPayloadFromJwt(accessToken),
        );
      },
    );
  }

  Widget _buildSignUp() {
    return SignUpForm(
      form: widget.signUpPage,
      urlAuthApi: widget.urlAuthApi,
      withTwoFactor: widget.withTwoFactor,
      onTapSignIn: () => _switchPage(0),
      onSuccessWithTwoFactor: (authId) {
        setState(() => _authId = authId);
        _switchPage(1);
      },
      onSuccess: () {
        // AuthenticationBloc.instance.add(
        //   AuthenticationEvent.login(accessToken, permissions, data),
        // );
        // widget.onLoginSuccess(
        //   accessToken,
        //   extractPayloadFromJwt(accessToken),
        // );
        _switchPage(0);
      },
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({
    required this.builder,
    required this.logoUrl,
    required this.logoNamedUrl,
  });
  final Widget Function(EdgeInsets contentPadding) builder;
  final String? logoUrl;
  final String? logoNamedUrl;

  @override
  Widget build(BuildContext context) {
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        final contentPadding = screenIdentifier.conditions(
          sm: const EdgeInsets.only(
            right: paddingHorizontalPage,
            left: paddingHorizontalPage,
          ),
          md: const EdgeInsets.only(right: 150, left: 150),
          lg: const EdgeInsets.only(right: 450, left: 150),
        );
        return Background(
          asset: AssetBackground.displayLogin,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
            child: Center(
              child: builder(contentPadding),
            ),
          ),
        );
      },
    );
  }
}
