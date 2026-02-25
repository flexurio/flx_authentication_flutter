import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:screen_identifier/screen_identifier.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    required this.builder,
    required this.logoUrl,
    required this.logoNamedUrl,
    super.key,
  });

  final Widget Function(EdgeInsets contentPadding) builder;
  final String? logoUrl;
  final String? logoNamedUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScreenIdentifierBuilder(
        builder: (context, screenIdentifier) {
          final isSmall = screenIdentifier.conditions(sm: true, md: false);
          final contentPadding = screenIdentifier.conditions(
            sm: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            md: const EdgeInsets.only(right: 150, left: 150),
            lg: const EdgeInsets.only(right: 450, left: 150),
          );
          return LoginBackground(
            asset: AssetBackground.displayLogin,
            child: Center(
              child: SingleChildScrollView(
                padding: isSmall ? const EdgeInsets.all(24) : null,
                child: ContainerGlass(
                  width: isSmall ? double.infinity : 900,
                  height: isSmall ? 560 : 600,
                  child: Stack(
                    children: [
                      if (isSmall)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: LoginLogo(
                              logoUrl: logoUrl,
                              logoNamedUrl: logoNamedUrl,
                              height: 60,
                            ),
                          ),
                        ),
                      Padding(
                        padding: isSmall
                            ? const EdgeInsets.only(top: 90)
                            : EdgeInsets.zero,
                        child: builder(contentPadding),
                      ),
                      if (!isSmall)
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
            ),
          );
        },
      ),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LoginLogo(
                    logoUrl: logoUrl,
                    logoNamedUrl: logoNamedUrl,
                    height: 300,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
