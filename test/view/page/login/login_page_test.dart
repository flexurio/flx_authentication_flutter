import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  late AuthenticationRepositoryApi originalRepo;

  setUpAll(() {
    flavorConfig = FlavorConfig(
      companyId: '1',
      companyName: 'Flexurio',
      companyPhone: '08123456789',
      companyWebsite: 'https://flexurio.erp',
      companyAddress: 'Flexurio Office',
      apiUrl: 'https://api.flexurio.erp',
      color: Colors.blue,
      colorSoft: Colors.blue.withValues(alpha: 0.1),
      backgroundLoginPage: '',
      applicationConfig: null,
    );
  });

  setUp(() {
    originalRepo = AuthenticationRepositoryApi.instance;
  });

  tearDown(() {
    AuthenticationRepositoryApi.instance = originalRepo;
  });

  testWidgets(
    'LoginPage forwards additionalField and onUsernameChanged in config mode',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final emitted = <String>[];
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(0.5)),
              child: LoginPage.prepare(
                onLoginSuccess: (_, __) async => <String, dynamic>{},
                withTwoFactor: true,
                loginType: LoginFormType.phone,
                usingPassword: false,
                usernameLabel: 'Phone Number',
                loginConfig: const LoginConfig(),
                additionalField: const Text('Company Dropdown Slot'),
                onUsernameChanged: emitted.add,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Company Dropdown Slot'), findsOneWidget);
      await tester.enterText(find.byType(TextField).first, '8123');
      await tester.pump();
      expect(emitted.last, '628123');
    },
  );

  testWidgets(
    'LoginPage resets onUsernameChanged on back from verification view',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              handler.resolve(
                Response<Map<String, dynamic>>(
                  requestOptions: options,
                  statusCode: 200,
                  data: <String, dynamic>{
                    'success': true,
                    'data': <String, dynamic>{'auth_at': '628123'},
                  },
                ),
              );
            },
          ),
        );
      AuthenticationRepositoryApi.instance = AuthenticationRepositoryApi(
        dio: dio,
        onUnauthorized: () {},
      );

      final emitted = <String>[];
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(0.5)),
              child: LoginPage.prepare(
                onLoginSuccess: (_, __) async => <String, dynamic>{},
                withTwoFactor: true,
                loginType: LoginFormType.phone,
                usingPassword: false,
                usernameLabel: 'Phone Number',
                loginConfig: const LoginConfig(),
                additionalField: const Text('Company Slot'),
                onUsernameChanged: emitted.add,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, '8123');
      await tester.pump();
      expect(emitted.last, '628123');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));

      expect(find.byType(BackButton), findsOneWidget);
      tester.widget<BackButton>(find.byType(BackButton)).onPressed!();
      await tester.pump();

      expect(emitted.last, '');
    },
  );

  testWidgets(
    'LoginCredentialView forwards additionalField in nipPassword mode',
    (tester) async {
      final emitted = <String>[];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(0.5)),
                child: LoginPage.prepare(
                  onLoginSuccess: (_, __) async => <String, dynamic>{},
                  withTwoFactor: false,
                  additionalField: const Text('Extra Field'),
                  onUsernameChanged: emitted.add,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Extra Field'), findsOneWidget);
      await tester.enterText(find.byType(TextField).first, 'USER01');
      await tester.pump();
      expect(emitted.last, 'USER01');
    },
  );
}
