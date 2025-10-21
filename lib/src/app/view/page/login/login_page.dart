import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:screen_identifier/screen_identifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._(
    this.onLoginSuccess,
    this.withTwoFactor,
    this.logoUrl,
    this.logoNamedUrl,
    this.urlAuthApi,
    this.usingPassword,
    this.usernameLabel,
  );

  final OnLoginSuccess onLoginSuccess;
  final bool withTwoFactor;
  final String? logoUrl;
  final bool usingPassword;
  final String usernameLabel;
  final String? logoNamedUrl;
  final String? urlAuthApi;

  static Widget prepare({
    required OnLoginSuccess onLoginSuccess,
    required bool withTwoFactor,
    String? logoUrl,
    String? logoNamedUrl,
    String? urlAuthApi,
    bool usingPassword = true,
    String usernameLabel = 'NIP',
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: LoginPage._(
        onLoginSuccess,
        withTwoFactor,
        logoUrl,
        logoNamedUrl,
        urlAuthApi,
        usingPassword,
        usernameLabel,
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
            _buildFormUsernamePassword(contentPadding),
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

  AnimatedContainer _buildFormUsernamePassword(EdgeInsets contentPadding) {
    return AnimatedContainer(
      padding: contentPadding,
      duration: const Duration(milliseconds: 350),
      child: LoginForm(
        usingPassword: widget.usingPassword,
        usernameLabel: widget.usernameLabel,
        urlAuthApi: widget.urlAuthApi,
        withTwoFactor: widget.withTwoFactor,
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
      ),
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
          child: Center(
            child: ContainerGlass(
              width:
                  screenIdentifier.conditions(sm: true, md: false) ? null : 900,
              height:
                  screenIdentifier.conditions(sm: true, md: false) ? null : 600,
              child: Stack(
                children: [
                  builder(contentPadding),
                  Positioned(
                    left: 600,
                    bottom: 0,
                    top: 0,
                    right: 0,
                    child: _buildLogo(screenIdentifier),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AnimatedSwitcher _buildLogo(ScreenIdentifier screenIdentifier) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: screenIdentifier.conditions(md: false, lg: true)
          ? ContainerGlass(
              width: 300,
              elevation: 0,
              opacity: .6,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child:
                        LogoNamed(logoUrl: logoUrl, logoNamedUrl: logoNamedUrl),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
