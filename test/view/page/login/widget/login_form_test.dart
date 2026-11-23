import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/view/widget/country_phone_code.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

Widget _buildTestSubject({
  required LoginFormType loginType,
  required bool usingPassword,
  LoginConfig? config,
  Widget? additionalField,
  ValueChanged<String>? onUsernameChanged,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(0.5)),
          child: BlocProvider(
            create: (_) => LoginBloc(),
            child: SingleChildScrollView(
              child: LoginForm(
                onSuccess: (_, __, ___, {refreshToken}) {},
                withTwoFactor: true,
                onSuccessWithTwoFactor: (_) {},
                urlAuthApi: 'https://auth.example.test/users/send-sms-code',
                usernameLabel: 'Phone Number',
                usingPassword: usingPassword,
                loginType: loginType,
                config: config,
                additionalField: additionalField,
                onUsernameChanged: onUsernameChanged,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
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

  testWidgets(
    'onUsernameChanged emits phone updates and empty string on clear',
    (tester) async {
      final emitted = <String>[];
      await tester.pumpWidget(
        _buildTestSubject(
          loginType: LoginFormType.phone,
          usingPassword: false,
          onUsernameChanged: emitted.add,
        ),
      );

      // Country code change while input is empty stays empty
      await tester.tap(find.byType(CountryCodeDropdown));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cari Negara'),
        '65',
      );
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('(+65)').last);
      await tester.pumpAndSettle();
      expect(emitted, isEmpty);

      // Entering digits emits prefixed phone
      await tester.enterText(find.byType(TextField).first, '8123');
      await tester.pump();
      expect(emitted.last, '658123');

      // Switching country code after entering digits emits updated prefix
      await tester.tap(find.byType(CountryCodeDropdown));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Cari Negara'),
        '62',
      );
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('(+62)').last);
      await tester.pumpAndSettle();
      expect(emitted.last, '628123');

      // Clearing input emits '' instead of bare country code
      await tester.enterText(find.byType(TextField).first, '');
      await tester.pump();
      expect(emitted.last, '');
    },
  );

  testWidgets(
    'config mode renders additionalField and validates it on submit',
    (tester) async {
      await tester.pumpWidget(
        _buildTestSubject(
          loginType: LoginFormType.phone,
          usingPassword: false,
          config: const LoginConfig(),
          additionalField: TextFormField(
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Company is required' : null,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).first, '8123456789');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Company is required'), findsOneWidget);
    },
  );

  testWidgets(
    'classic nipPassword emits onUsernameChanged and validates additionalField',
    (tester) async {
      final emitted = <String>[];
      await tester.pumpWidget(
        _buildTestSubject(
          loginType: LoginFormType.nipPassword,
          usingPassword: false,
          onUsernameChanged: emitted.add,
          additionalField: TextFormField(
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Company required' : null,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).first, 'NIP001');
      await tester.pump();
      expect(emitted.last, 'NIP001');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Company required'), findsOneWidget);
    },
  );
}
