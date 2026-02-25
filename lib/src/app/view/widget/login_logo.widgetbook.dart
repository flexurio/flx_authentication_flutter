import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: LoginLogo,
)
Widget loginLogoDefaultUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF0F172A),
    body: Center(
      child: LoginLogo(
        logoUrl: context.knobs.stringOrNull(
          label: 'Logo URL',
        ),
        logoNamedUrl: context.knobs.stringOrNull(
          label: 'Logo Named URL',
        ),
        height: context.knobs.double.slider(
          label: 'Height',
          initialValue: 40,
          min: 20,
          max: 200,
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Network Image',
  type: LoginLogo,
)
Widget loginLogoNetworkUseCase(BuildContext context) {
  return const Scaffold(
    backgroundColor: Color(0xFF0F172A),
    body: Center(
      child: LoginLogo(
        logoUrl:
            'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cc1d0b3333.png',
        height: 80,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Local Asset',
  type: LoginLogo,
)
Widget loginLogoLocalUseCase(BuildContext context) {
  return const Scaffold(
    backgroundColor: Color(0xFF0F172A),
    body: Center(
      child: LoginLogo(
        logoUrl: 'assets/images/logoipsum.png',
        height: 60,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Combined Assets',
  type: LoginLogo,
)
Widget loginLogoCombinedUseCase(BuildContext context) {
  return const Scaffold(
    backgroundColor: Color(0xFF0F172A),
    body: Center(
      child: LoginLogo(
        logoUrl: 'assets/images/logoipsum.png',
        logoNamedUrl: 'assets/images/logoipsum-named.png',
        height: 48,
      ),
    ),
  );
}
